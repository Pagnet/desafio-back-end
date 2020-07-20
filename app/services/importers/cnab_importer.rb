module Importers
  class CnabImporter
    TYPE_POSITION = { start_at: 0, size: 1 }.freeze
    DATE_POSITION = { start_at: 1, size: 8 }.freeze
    AMOUNT_POSITION = { start_at: 9, size: 10 }.freeze
    CPF_POSITION = { start_at: 19, size: 11 }.freeze
    CARD_POSITION = { start_at: 30, size: 12 }.freeze
    TIME_POSITION = { start_at: 42, size: 6 }.freeze
    STOREKEEPER_POSITION = { start_at: 48, size: 14 }.freeze
    STORE_POSITION = { start_at: 62, size: 19 }.freeze

    def perform(file_path)
      File.foreach(file_path) { |line| import_transaction(line) }
    end

    def import_transaction(line)
      parsed_transaction = parse_line(line)

      type = TransactionType.find(parsed_transaction.type)
      customer = Customer.find_or_create_by(cpf: parsed_transaction.cpf)
      card = Card.find_or_create_by(number: parsed_transaction.card_number)
      store = sync_store(parsed_transaction.store, parsed_transaction.storekeeper)

      Transaction.create(
        transaction_type: type,
        customer: customer,
        card: card,
        store: store,
        processed_at: parsed_transaction.processed_at,
        amount: parsed_transaction.amount
      )
    end

    def parse_line(line)
      type = line.slice(TYPE_POSITION[:start_at], TYPE_POSITION[:size])
      date = line.slice(DATE_POSITION[:start_at], DATE_POSITION[:size])
      time = line.slice(TIME_POSITION[:start_at], TIME_POSITION[:size])
      amount = line.slice(AMOUNT_POSITION[:start_at], AMOUNT_POSITION[:size])
      cpf = line.slice(CPF_POSITION[:start_at], CPF_POSITION[:size])
      card_number = line.slice(CARD_POSITION[:start_at], CARD_POSITION[:size])
      storekeeper = line.slice(STOREKEEPER_POSITION[:start_at], STOREKEEPER_POSITION[:size])
      store = line.slice(STORE_POSITION[:start_at], STORE_POSITION[:size])

      OpenStruct.new(
        type: type.to_i,
        processed_at: DateTime.strptime(date + ' ' + time, '%Y%m%d %H%M%S'),
        amount: amount.to_f / 100.0,
        cpf: cpf,
        card_number: card_number,
        storekeeper: storekeeper.strip,
        store: store.strip
      )
    end

    private

    def sync_store(store, storekeeper)
      store = Store.find_or_create_by(name: store)
      store.update(storekeeper: storekeeper) if store.storekeeper != storekeeper
      store
    end
  end
end

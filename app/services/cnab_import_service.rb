class CnabImportService

  def initialize(importer)
    @importer = importer
  end

  def process
    file_path = Rails.root + @importer.file.blob.filename.to_s
    File.foreach(file_path) do |line|
      import_transaction(line)
    end
  end

  def import_transaction(line)
    begin
      kind = process_kind(line)
      processed_at = process_processed_at(line)
      amount = process_amount(line)
      cpf = process_cpf(line)
      card = process_card(line)
      store = process_store(line)

      byebug

      Transaction.create!(kind: kind[:kind],
                          kind_description: kind[:description],
                          processed_at: processed_at,
                          amount: amount,
                          cpf: cpf,
                          card: card,
                          store: store,
                          importer: @importer)

    rescue Exception => e
    end

  end

  def store(store_name, shopkeeper)
    Store.find_or_create_by!(name: store_name, shopkeeper: shopkeeper)
  end

  def process_kind(line)
    element = line.slice(0)
    Transaction::KINDS[element.to_sym]
  end

  def process_processed_at(line)
    date = line.slice(1..8)
    hour = line.slice(42..47)
    DateTime.strptime(date + ' ' + hour, '%Y%m%d %H%M%S')
  end

  def process_amount(line)
    line.slice(9..18).to_i
  end

  def process_cpf(line)
    line.slice(19..29)
  end

  def process_card(line)
    line.slice(30..41)
  end

  def process_store(line)
    shopkeeper = line.slice(48..61)
    store_name = line.slice(62..80)
    store(store_name, shopkeeper)
  end

end



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
      type = line.slice(0)
      date = line.slice(1..8)
      value = line.slice(9..18)
      cpf = line.slice(19..29)
      card = line.slice(30..41)
      hour = line.slice(42..47)
      shopkeeper = line.slice(48..61)
      store_name = line.slice(62..80)

      kind = Transaction::KINDS[type.to_sym]

      processed_at = DateTime.strptime(date + ' ' + hour, '%Y%m%d %H%M%S')
      amount = value.to_i

      store = store(store_name, shopkeeper)

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

end



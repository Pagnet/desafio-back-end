class FileParser
  def initialize(file_content)
    @file_content = file_content
    @start_ranges = {
      kind: 0,
      date: 1,
      value: 9,
      cpf: 19,
      card_number: 30,
      hour: 42,
      store_owner_name: 48,
      store_name: 62
    }

    @end_ranges = {
      kind: 0,
      date: 8,
      value: 18,
      cpf: 29,
      card_number: 41,
      hour: 47,
      store_owner_name: 61,
      store_name: 80
    }
  end

  def perform
    parse_file
  end

  private

  def parse_file
    @file_content.each_line do |line|
      @store_attributes = {
        name: line[@start_ranges[:store_name]..@end_ranges[:store_name]].remove("\n"),
        owner_name: line[@start_ranges[:store_owner_name]..@end_ranges[:store_owner_name]]
      }

      build_store

      @transaction_attributes = {
        kind: line[@start_ranges[:kind]..@end_ranges[:kind]],
        value: line[@start_ranges[:value]..@end_ranges[:value]].to_f / 100,
        cpf: line[@start_ranges[:cpf]..@end_ranges[:cpf]],
        card_number: line[@start_ranges[:card_number]..@end_ranges[:card_number]],
        date_and_hour: Time.parse("#{line[@start_ranges[:date]..@end_ranges[:date]].insert(4, '/').insert(7,'/')} #{line[@start_ranges[:hour]..@end_ranges[:hour]].scan(/.{1,2}/).join(":")}"),
        store_id: @store_id
      }

      build_transaction
    end
  end

  def build_transaction
    Transaction.create(@transaction_attributes)
  end

  def build_store
    Store.find_or_initialize_by(name: @store_attributes[:name]).update(owner_name: @store_attributes[:owner_name])

    @store_id = Store.find_by(name: @store_attributes[:name]).id
  end

end
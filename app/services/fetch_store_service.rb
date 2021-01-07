class FetchStoreService

  def initialize(parsed_record)
    @parsed_record  = parsed_record
  end

  def self.build(parsed_record)
    new(parsed_record).perform
  end

  def perform

    store_data = store_data(@parsed_record)

    store = fetch_store(store_data) || create_store(store_data)
  end

  private

  def store_data(parsed_record)
    {
      name: parsed_record[:store_name],
      owner: parsed_record[:store_owner]
    }
  end

  def fetch_store(store_data)
    Store.find_by_name(store_data[:name])
  end

  def create_store(store_data)
    Store.create(store_data) rescue false
  end

end
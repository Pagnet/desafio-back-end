module StoreAdapter

  def self.adapt(data)
    {
        name: data[:store_name],
        owner: data[:store_owner],
    }
  end

end
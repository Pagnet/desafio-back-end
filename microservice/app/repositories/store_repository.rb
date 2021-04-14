class StoreRepository
  def self.find_or_create(attributes)
    Store.find_or_create_by(
      :name => attributes[:name].strip,
      :owner => attributes[:owner].strip,
    )
  end
end

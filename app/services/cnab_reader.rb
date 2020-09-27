# frozen_string_literal: true

class CnabReader
  def initialize(file_path)
    @file_path = file_path
  end

  def execute
    File.readlines(@file_path).each { |line| create_store_operation(line) }
  end

  private

  def build_store_operation(content)
    {
      kind: get_attribute(content, :kind).to_i,
      operated_at: to_time(get_attribute(content, :date, :time)),
      amount: get_attribute(content, :amount).to_i,
      document: get_attribute(content, :document),
      card: get_attribute(content, :card),
      store_id: to_store(to_string(get_attribute(content, :store)),
                         to_string(get_attribute(content, :storekeeper))).id
    }
  end

  def create_store_operation(line)
    StoreOperation.create(build_store_operation(line))
  end

  def get_attribute(line, *attribute_names)
    attribute_names.map do |attribute|
      line[attributes_range[attribute][:start]...attributes_range[attribute][:end]]
    end.join(' ')
  end

  def attributes_range
    {
      kind: { start: 0, end: 1 },
      date: { start: 1, end: 9 },
      amount: { start: 9, end: 19 },
      document: { start: 19, end: 30 },
      card: { start: 30, end: 42 },
      time: { start: 42, end: 48 },
      storekeeper: { start: 48, end: 62 },
      store: { start: 62, end: 81 }
    }
  end

  def to_store(name, storekeeper)
    Store.find_or_create_by(name: name, storekeeper: storekeeper)
  end

  def to_string(string)
    string.strip.gsub(/\s+/, ' ')
  end

  def to_time(string)
    string.to_datetime
  end
end

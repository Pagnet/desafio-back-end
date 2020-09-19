module FileStorage
  require_relative './file_storage/local_storage'

  def self.client
    if Rails.env.test?
      FileStorage::LocalStorage.new(Rails.root.join('spec/file_storage'))
    else
      FileStorage::LocalStorage.new(Rails.root.join('public/file_storage'))
    end
  end

  module Storeable
    def read
      storage.read!(self.storage_filepath)
    end

    def storage
      @storage ||= FileStorage.client
    end

    def storage=(storage)
      @storage = storage
    end

    def write_on_storage!(content, options = {})
      storage.write!(self.storage_filepath, content, options)
    end

    def file_url
      storage.signed_url(self.storage_filepath)
    end
  end
end

require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads')
}  

Shrine.plugin :activerecord
Shrine.plugin :determine_mime_type
Shrine.plugin :validation_helpers, default_messages: {
  mime_type_inclusion: ->(whitelist) {
    I18n.translate('attachment.wrong_mime')
  }
}
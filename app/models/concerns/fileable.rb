module Fileable
  extend ActiveSupport::Concern

  include FileStorage::Storeable

  MAX_FILE_SIZE = 5.megabytes.freeze

  ACCEPTED_CONTENT_TYPES = %w(text/plain).freeze

  PROCESSORS = { 'CnabParser' => AttachedFile::Processors::CnabParser }.freeze

  KINDS = PROCESSORS.keys.freeze
  STATUS = %w(pending processing processed error).freeze

  def filepath
    self.id ||= SecureRandom.uuid
    filename = "#{self.id}#{File.extname(self.filename)}"
    path = ['attached_files', filename].join('/')

    self[:filepath] ||= path
  end

  def storage_filepath
    self.filepath
  end

  def metadata
    self[:metadata] ||= { 'errors' => [], 'resources' => [] }
  end

  def process
    processor_class = fetch_processor(self.kind)
    result = processor_class.new(self).call
    self.reload
    result
  end

  def fetch_processor(kind)
    @processor_class ||= PROCESSORS[kind] || raise(RuntimeError,
      "Couldn't find processor for attached_file '#{self.id}' kind '#{self.kind}'"
    )
  end

  def translated_error_messages
    errors = self.metadata['errors'] || []

    errors.map do |err|
      I18n.t(err['error_key']) % err['error_args'].symbolize_keys
    end
  end
end

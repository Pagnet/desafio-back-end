class Operations::AttachedFile::Create
  include OperationResult::Operation

  attr_reader :logger

  def initialize(logger: Rails.logger)
    @logger = logger
  end

  def process(params)
    attached_file = AttachedFile.new(
      filename: params[:filename],
      kind: params[:kind]
    )

    attached_file.write_on_storage!(File.read(params[:filepath]))
    attached_file.save
    attached_file.reload
    result.assign(:attached_file, attached_file)
  end

  def validate(params)
    validate_kind(params[:kind])
    validate_file(params[:filepath])
    validate_file_has_content(params[:filepath])
    validate_file_size(params[:filepath])
    validate_content_type(params[:content_type])
  end

  private

  def validate_kind(kind)
    accepted_kinds = AttachedFile::KINDS
    result.add_error(
      i18n_error_key(:invalid_kind),
      accepted_kinds: accepted_kinds.join(', '),
      given_kind: kind
    ) unless accepted_kinds.include?(kind)
  end

  def validate_file(filepath)
    result.add_error(
      i18n_error_key(:file_does_not_exist)
    ) unless filepath.present? && File.exists?(filepath)
  end

  def validate_file_size(filepath)
    filesize = File.size(filepath)
    result.add_error(
      i18n_error_key(:invalid_file_size),
      max: "#{AttachedFile::MAX_FILE_SIZE / 1024 / 1024}MB"
    ) if filesize > AttachedFile::MAX_FILE_SIZE
  end

  def validate_content_type(content_type)
    accepted_types = AttachedFile::ACCEPTED_CONTENT_TYPES
    result.add_error(
      i18n_error_key(:invalid_content_type),
      accepted_types: accepted_types.join(', '),
      given_type: content_type
    ) unless accepted_types.include?(content_type)
  end

  def validate_file_has_content(filepath)
    file = File.read(filepath)
    result.add_error(
      i18n_error_key(:content_empty)
    ) if file.empty?
  end

  def i18n_error_key(key)
    "operations.attached_file.create.errors.#{key}"
  end
end
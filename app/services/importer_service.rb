class ImporterService
  include ActiveStorage::Downloading

  attr_reader :importer

  def initialize(importer_id)
    @importer = Importer.find(importer_id)
  end

  def call
    begin
      download_blob_to_tempfile do |tempfile|
        rows = CnabParser.new(tempfile.path).call

        ActiveRecord::Base.transaction do
          rows.each do |operation_params|
            store_name = operation_params.delete(:store)

            store = Store.find_or_create_by!(name: store_name)

            Operation.create!(operation_params.merge(store_id: store.id))
          end
        end
      end
      importer.success!
    rescue StandardError => e
      importer.update_columns(status: :error, error_message: e.full_message)
    end
  end

  private

  def blob
    @blob ||= importer.file.blob
  end
end

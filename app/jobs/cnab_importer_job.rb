class CnabImporterJob < ApplicationJob
  queue_as :default

  def perform(file_imported_id)
    file_imported = FileImported.find(file_imported_id)
    file_path = Rails.root + file_imported.file.blob.filename.to_s
    Importers::CnabImporter.new.perform(file_path)
  end
end

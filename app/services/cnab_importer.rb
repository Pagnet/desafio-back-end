class CnabImporter < ApplicationService
  attr_reader :imported_file

  def initialize(imported_file)
    @imported_file = imported_file
  end

  def call
    return false unless @imported_file.save

    ProcessCnabJob.perform_later(@imported_file.id)
  end
end
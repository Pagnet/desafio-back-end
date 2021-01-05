class ParseFileJob

  def perform(file_cnab, cnab_importation_id)
    InterpretFileService.build(file_cnab, cnab_importation_id)
  end
  handle_asynchronously :perform, queue: :parse_file_job, priority: 1

end
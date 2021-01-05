class ParseFileJob

  def perform(cnab_importation_id)
    InterpretFileService.build(cnab_importation_id)
  end
  handle_asynchronously :perform, queue: :parse_file_job, priority: 1

end
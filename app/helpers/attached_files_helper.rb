module AttachedFilesHelper
  def current_url(url)
    request.url == url ? 'active' : ''
  end

  def url_for_errors(attached_file, status)
    link_to status, "#attached-files-errors-#{attached_file.id}", data: { toggle: 'modal', could_not_parse: attached_file.metadata['could_not_parse'], errors: attached_file.errors, id: attached_file.id }
  end
end

module AttachedFilesHelper
  def current_url(url)
    request.url == url ? 'active' : ''
  end
end

class AttachedFilesController < ApplicationController

  def index
    @attached_files = AttachedFile.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def create
    file = attached_file_params[:file]
    kind = attached_file_params[:kind]

    operation = Operations::AttachedFile::Create.new
    result = operation.call({
      'kind' => kind,
      'content_type' => file&.content_type,
      'filename' => file&.original_filename,
      'filepath' => file&.tempfile
    })

    flash[:success] = I18n.t('controllers.attached_files.success') if result.success?
    flash[:danger] = result.translated_errors if result.failure?

    redirect_to attached_files_path
  end

  def attached_file_params
    params.permit(:kind, :file)
  end
end

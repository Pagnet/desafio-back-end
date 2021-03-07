# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def upload
    uploaded_file = params[:cnab_file] if params[:cnab_file].present?

    unless uploaded_file.present?
      flash[:error] = "You need to choose a file"
      redirect_to(root_path)
      return false
    end

    if File.zero?(uploaded_file)
      flash[:error] = "File is empty"
      redirect_to(root_path)
      return false
    end

    unless uploaded_file.content_type == "text/plain"
      flash[:error] = "Invalid file type"
      redirect_to(root_path)
      return false
    end

    flash[:success] = "File uploaded successfully"
    redirect_to(root_path)
  end
end

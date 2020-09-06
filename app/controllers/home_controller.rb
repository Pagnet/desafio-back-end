class HomeController < ApplicationController

  def index
    redirect_to platform_root_path if current_user.present?
  end

end

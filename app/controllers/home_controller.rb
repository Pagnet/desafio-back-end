class HomeController < ApplicationController

  def index
    if current_user.present?
      redirect_to platform_root_path
    else
      redirect_to new_user_session_path
    end
  end
end

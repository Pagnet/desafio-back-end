class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include SessoesHelper

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end
end

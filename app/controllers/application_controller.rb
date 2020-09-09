class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include SessoesHelper

  def authorize
    unless logado?
      redirect_to root_url
    end
  end
end

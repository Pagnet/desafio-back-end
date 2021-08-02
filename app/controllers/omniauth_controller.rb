class OmniauthController < ApplicationController
  skip_before_action :authenticate_user!

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'Ocorreu um problema com o login pelo Facebook. Por favor se registre ou tente novamente mais tarde'
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = 'Ocorreu um problema com o login pelo Github. Por favor se registre ou tente novamente mais tarde'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'Ocorreu um problema com o login pelo Google. Por favor se registre ou tente novamente mais tarde'
      redirect_to new_user_registration_url
    end
  end

  def passthru
    
  end

  def failure
    flash[:error] = 'Ocorreu um problema com o login pelo Google. Por favor se registre ou tente novamente mais tarde'
    redirect_to new_user_registration_url
  end
end

class UsuariosController < ApplicationController
	before_action :bloquear_acesso, except: [:edit, :update, :home]

  def new
    @usuario = Usuario.new
  end

  def create
  	@usuario = Usuario.new(usuario_params)
  	if @usuario.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
      redirect_to edit_usuario_path(current_user)
    else
      render 'edit'
    end
  end

  def home
  end

  private
  def usuario_params
    params.require(:usuario).permit(:nome, :cpf, :email, :celular, :user, :password, :password_confirmation)
  end
end

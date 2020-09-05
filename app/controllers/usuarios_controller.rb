class UsuariosController < ApplicationController
	before_action :bloquear_acesso, except: [:edit, :update, :home]

  def new
    @usuario = Usuario.new
  end

  def create
  	@usuario = Usuario.new(estagiario_params)
  	if @usuario.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @estagiario = Estagiario.find(params[:id])
  end

  def update
    @estagiario = Estagiario.find(params[:id])
    if @estagiario.update_attributes(estagiario_params)
      redirect_to edit_estagiario_path(current_user)
    else
      render 'edit'
    end
  end

  def home
  end

  private
  def estagiario_params
    params.require(:usuario).permit(:nome, :cpf, :email, :celular, :user, :password, :password_confirmation)
  end
end

class SessoesController < ApplicationController
	before_action :bloquear_acesso, except: [:destroy]

  def new
  end

  def create
  	usuario = Usuario.find_by(user: params[:session][:user])
    if usuario && usuario.authenticate(params[:session][:password])
      login(usuario)
      redirect_to transacoes_path
 	  else
      if !usuario
        flash.now[:danger] = 'Usuário não encontrado.'
 	    else
        flash.now[:danger] = 'Senha inválida, tente novamente.'
      end
      render 'new'
 	  end
  end

  def destroy
	  logout
    redirect_to root_url
  end
end

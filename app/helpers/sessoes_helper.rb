module SessoesHelper
	def login(estagiario)
    session[:estagiario_id] = estagiario.id
  end

  def current_user
    @current_user ||= Usuario.find_by(id: session[:estagiario_id])
  end

  def bloquear_acesso
    if current_user.present?
      redirect_to transacoes_path
    end
  end

  def logado?
    !current_user.nil?
  end

  def logout
    session.delete(:estagiario_id)
    @current_user = nil
  end
end

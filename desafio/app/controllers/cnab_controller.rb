require 'pry'
class CnabController < ApplicationController
  before_action :cnabs, only:[:index]
  SOMAR = ['1','4','5','6','7','8']
  SUBTRAIR = ['2','3','9']

  def index
    summary_by_store
  end

  def create
    begin
      upload(params[:file])
      msg = "Arquivo carregado"
    rescue ArgumentError
      msg = "Arquivo contem erro"
    rescue
      msg = "Erro processando arquivo"
    end

    redirect_to '/cnab', notice: msg
  end


  private

  def cnabs
    @cnabs ||= Cnab.all
  end

  def upload(file)
    data = file.read

    data.split("\n").each { |line|
      Cnab.create_from_file line
    }
  end

  def summary_by_store
    @summary = {}

    cnabs.each do |cnab|
      @summary[cnab.nome_da_loja] = { valor: 0.0, data: []} if @summary[cnab.nome_da_loja].blank?
      @summary[cnab.nome_da_loja][:valor] += cnab.valor if SOMAR.include?(cnab.tipo) 
      @summary[cnab.nome_da_loja][:valor] -= cnab.valor if SUBTRAIR.include?(cnab.tipo) 
      @summary[cnab.nome_da_loja][:data] << cnab 

    end

    @summary
  end

end

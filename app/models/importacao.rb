class Importacao < ApplicationRecord
  
  def arquivo=(value)
    if value.is_a?(String)
      super(value)
    else 
      nome_arquivo = "#{Time.now.to_i}_#{value}"
      caminho = "#{Rails.root}/public/arquivos/"
      caminho_completo = "#{caminho}#{nome_arquivo}"
      
      Dir.mkdir(caminho) unless Dir.exists?(caminho)
      File.open(caminho_completo, "wb") { |f| f.write(value.read)} 
      
      super("/arquivos/#{nome_arquivo}")
      
      carregar(caminho_completo)
    end
  end
  
  def carregar(arquivo)
    
    File.open(arquivo).each do |line|
      if line.length == 81
        transacao = line[0..0]
        data = line[1..8]
        movimentacao = line[9..18]
        cpf = line[19..29]
        cartao = line[30..41]
        hora = line[42..47]
        nm_representante = line[48..61]
        nm_loja = line[62..80]
        
        dt_ocorrencia = DateTime.new(data[0..3].to_i,data[4..5].to_i,data[6..7].to_i).strftime("%d/%m/%Y")
        
        if [2, 3, 9].include? transacao.to_i 
          vl_movimentacao = ((movimentacao.to_i)/100) * (-1)
        else
          vl_movimentacao = (movimentacao.to_i)/100
        end
        
        case transacao.to_i
        when 1
          tp_transacao = "Débito"
        when 2
          tp_transacao = "Boleto"
        when 3
          tp_transacao = "Financiamento"
        when 4
          tp_transacao = "Crédito"
        when 5
          tp_transacao = "Recebimento Empréstimo"
        when 6
          tp_transacao = "Vendas"
        when 7
          tp_transacao = "Recebimento TED"
        when 8
          tp_transacao = "Recebimento DOC"
        when 9
          tp_transacao = "Aluguel"
        end
        
        Loja.create(tp_transacao: tp_transacao, 
                    dt_ocorrencia: dt_ocorrencia, 
                    vl_movimentacao: vl_movimentacao, 
                    cpf: cpf, 
                    cartao: cartao, 
                    hora: hora, 
                    nm_representante: nm_representante,
                    nm_loja: nm_loja)
        puts(line.length)
      end
    end
  end
  
end




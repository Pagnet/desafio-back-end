class Cnab < ApplicationRecord

  def self.create_from_file(line)
    splitedLine = line.force_encoding('UTF-8').split('')

    raise ArgumentError.new("Linha não contem formato tamanho esperado") if splitedLine.size != 80

    create({
      tipo: splitedLine[0],
      data: formatted_date(splitedLine[1..8].join), 
      valor: formatted_valor(splitedLine[9..18].join), 
      cpf: formatted_cpf(splitedLine[19..29].join), 
      cartao: splitedLine[30..41].join, 
      hora: formatted_time(splitedLine[42..47].join), 
      dono_da_loja: splitedLine[48..61].join, 
      nome_da_loja: splitedLine[62..80].join
    })
  end

  private

  def self.formatted_valor(valor)
    v = valor.to_i / 100
    t = valor.match(/(\d{1,})(\d{2})/)

    "#{t[1]}.#{t[2]}"
  end

  def self.formatted_date(valor)
    Date.parse(valor).strftime('%d/%m/%y')
  end

  def self.formatted_time(valor)
    t = valor.match(/(\d{2})(\d{2})(\d{2})/)

    "#{t[1]}:#{t[2]}:#{t[3]}"
  end

  def self.formatted_cpf(valor)
    t = valor.match(/(\d{3})(\d{3})(\d{3})(\d{2})/)

    "#{t[1]}.#{t[2]}.#{t[3]}-#{t[4]}"
  end

end

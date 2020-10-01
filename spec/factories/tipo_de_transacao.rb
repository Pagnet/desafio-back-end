FactoryBot.define do
  factory :tipo_de_transacao do
  	trait :debito do
  		tipo {3}
  		descricao {"Financiamento"}
  		natureza {"Saída"}
  		sinal {"-"}
  	end
  end
end

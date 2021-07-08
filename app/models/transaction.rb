class Transaction < ApplicationRecord
    before_create :transaction_validade, :time_format, :cpf_format

    enum transaction_type: { debito: 1, boleto: 2, 
                            financiamento: 3, credito: 4,
                            recebimento_emprestimo: 5, vendas: 6, 
                            recebimento_ted: 7, recebimento_doc: 8, aluguel: 9 
    }

    validates :transaction_type, :date, :value, :cpf, :card, :hour, :store_owner, :store_name, presence: true

    private

    def transaction_validade

        negative_transactions_types = ["boleto","financiamento","aluguel"]

        negative_transactions_types.each do |negative_transaction|

            if self.transaction_type.start_with?(negative_transaction) 
                self.value = self.value * -1 
            else  
                self.value
            end
        end
        self.value
    end

    def time_format
        split = self.hour.split("")
        self.hour = "#{split[0]+split[1]}h #{split[2]+split[3]}min #{split[4]+split[5]}s"  
    end
    
    def cpf_format
        split = self.cpf.split("")
        self.cpf = "#{split[0]+split[1]+split[2]}.#{split[3]+split[4]+split[5]}.#{split[6]+split[7]+split[8]}-#{split[9]+split[10]}"  
    end
end

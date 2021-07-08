class TransactionController < ApplicationController
    
    def create 
        @transaction = []

        cnab_file.each do |cnab|
            transaction = Transaction.new
            transaction.transaction_type = cnab[:transaction_type]
            transaction.date = cnab[:date]
            transaction.value = cnab[:value]
            transaction.cpf = cnab[:cpf]
            transaction.card = cnab[:card]
            transaction.hour = cnab[:hour]
            transaction.store_owner = cnab[:store_owner] 
            transaction.store_name = cnab[:store_name]
            transaction.save
            @transaction << transaction.id
        end

        if @transaction.count.eql?(cnab_file.count)

          redirect_to "/transaction/results", notice: "Importado com sucesso !"
        else
          
          render root_path, alert: "Falha ao importar o arquivo !"
        end

    end

    def results
        store_names = []
        store_names_and_values = []
        @transactions = []
                
        @finded_transactions = Transaction.order(store_name: :asc)
        
        @finded_transactions.each do |transaction|
            store_names << transaction.store_name
            store_names_and_values << {transaction.store_name => transaction.value}
        end
        
        store_names.uniq.each do |store_name|
            transactions_total = []

            store_names_and_values.map do |transactions_value|
                transactions_total << transactions_value[store_name]
            end

            @transactions << [store_name, transactions_total.compact.sum.truncate(2)]

        end

        @transactions

    end
    
    
    private
    
    def uploaded_file
        params.require(:cnab_input).tempfile.path
    end
    
    def cnab_file
        cnab_content = []
        cnab_parsed = []
        
        file = File.read(uploaded_file)
        
        file.each_line {|transaction| 
            cnab_content << transaction.chomp!('').split('') 
        }

        cnab_content.map do |index|
            cnab_hash = {}
            
            cnab_hash.store(:transaction_type, index[0].to_i)
            cnab_hash.store(:date, index[1..8].join)
            cnab_hash.store(:value, index[9..18].join.to_i / 100.00 )
            cnab_hash.store(:cpf, index[19..29].join)
            cnab_hash.store(:card, index[30..41].join)
            cnab_hash.store(:hour, index[42..47].join)
            cnab_hash.store(:store_owner, index[48..61].join.strip)
            cnab_hash.store(:store_name, index[62..80].join.strip)

            cnab_parsed << cnab_hash
            
        end

        cnab_parsed
    end
    
end
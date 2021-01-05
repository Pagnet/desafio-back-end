class InterpretFileService

  def initialize(file_cnab, cnab_importation_id)
    @file_cnab           = file_cnab
    @cnab_importation_id = cnab_importation_id
    @status              = nil
  end

  def self.build(file_cnab, cnab_importation_id)
    
    CnabImportation.find(cnab_importation_id).update_status(:processing)
    new(file_cnab, cnab_importation_id).perform
  end

  def perform
    
    ActiveRecord::Base.transaction do
      @file_cnab.each do |record|
        parsed_record    = parse(record)
        store            = FetchStoreService.build(parsed_record)
        transaction_type = fetch_transaction_type(parsed_record[:transaction_type])
        @status = CreateTransactionService.build(parsed_record, store.id, transaction_type.id)
        if @status == false
          raise ActiveRecord::Rollback
        end
      end
     
    end
    CnabImportation.find(@cnab_importation_id).update_status(@status == false ? :failed : :concluded )
  end


  private

  def parse(record)

    parsed = {
      transaction_type: (record[0].to_i),
      date:             record[1..8],
      amount:           (record[9..18].to_f / 100),
      cpf:              record[19..29],
      card_number:      record[30..41],
      time:             record[42..47],
      store_owner:      record[48..61].strip,
      store_name:       record[62..80].strip,
    }

    return parsed

  end
  
  def fetch_transaction_type(transaction_type)

    TransactionType.find_by_sort(transaction_type)

  end

end
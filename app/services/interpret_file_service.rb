class InterpretFileService

  def initialize(cnab_importation_id)
    @cnab_importation  = CnabImportation.find(cnab_importation_id)
    @status            = nil
  end

  def self.build(cnab_importation_id)
    CnabImportation.find(cnab_importation_id).update_status(:processing)
    new(cnab_importation_id).perform
  end

  def perform
    ActiveRecord::Base.transaction do
      @cnab_importation.file.each do |record|
        if valid_number_characters?(record)
          parsed_record    = parse(record)
          store            = FetchStoreService.build(parsed_record)
          transaction_type = fetch_transaction_type(parsed_record[:transaction_type])
          @status          = CreateTransactionService.build(parsed_record, store.id, transaction_type.id)
          if @status == false
            raise ActiveRecord::Rollback
          end
        else
          raise ActiveRecord::Rollback
        end
      end
    end
    @cnab_importation.update(file: info_record, status: @status == false ? :failed : :concluded)
  end


  private

  def fetch_transaction_type(transaction_type)
    TransactionType.find_by_sort(transaction_type)
  end 

  def info_record
    info_file = { 
      results: []
    }
    @cnab_importation.file.each_with_index do |record, index|
      if valid_number_characters?(record)
        parsed_record = parse(record)
        info_file[:results] << {
          line:             (index + 1),
          record:           record,
          transaction_type: is_number?(parsed_record[:transaction_type]),
          date:             is_date?(parsed_record[:date]),
          amount:           is_number?(parsed_record[:amount]),
          cpf:              is_number?(parsed_record[:cpf]),
          card_number:      parsed_record[:card_number].present?,
          time:             is_time?(parsed_record[:time]),
          store_owner:      parsed_record[:store_name].present?,
          store_name:       parsed_record[:store_name].present?
        }
      else
        info_file[:results] << {
          line:             (index + 1),
          record:           record,
          error: "N° de caracteres inválido"
        }
      end
    end
    return info_file
  end

  def is_number?(string)
    true if Float(string) rescue false
  end

  def is_time?(string)
    true if DateTime.strptime(string, '%H%M%S') rescue false
  end

  def is_date?(string)
    true if DateTime.strptime(string, '%Y%m%d') rescue false
  end

  def valid_number_characters?(record)
    return if record.size == 81
  end

  def parse(record)

    parsed = {
      transaction_type: (record[0].to_i),
      date:             record[1..8],
      amount:           (record[9..18].to_f / 100),
      cpf:              record[19..29],
      card_number:      record[30..41],
      time:             record[42..47],
      store_owner:      record[48..61].strip,
      store_name:       record[62..80].strip
    }

    return parsed

  end
  
end
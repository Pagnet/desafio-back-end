FactoryBot.define do
  factory :cnab_importation do
    status { :starting }
    file  {
      results =
      [
        {
          cpf: true, 
          date: true, 
          line: 1, 
          time: true, 
          amount: true, 
          record: "3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n", 
          status: true, 
          store_name: true, 
          card_number: true, 
          store_owner: true, 
          transaction_type: true
        }
      ]
    }
  end
end
module UseCases
  module Transactions
    module Upload
      class CNAB
        def self.execute(params)
          Repositories::Transaction::create("TESTEEEE")
          # validate_data(params)
          # @repo.create(params)
        end

        private

        def validate_data(attrs)
          puts "validate_data"
        end
      end
    end
  end
end

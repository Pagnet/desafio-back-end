module UseCase
  module Transaction
    class Upload < UseCase::Base
      def call(attrs)
        validate_data(attrs)
        repository.create(attrs)
      end

      private

      def validate_data(attrs)
      end
    end
  end
end

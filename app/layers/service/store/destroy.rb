module Service
  module Store
    class Destroy
      def self.execute(id:)
        ActiveRecord::Base.transaction do
          record = ::Store.find(id)
          record.destroy!

          record
        end
      end
    end
  end
end

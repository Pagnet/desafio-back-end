module Service
  module Store
    class Show
      def self.execute(id:, **config)
        ::Store.includes(:financial_entries).find_by!(id: id).decorate
      end
    end
  end
end

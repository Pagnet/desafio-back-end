module Service
  module Store
    class Update
      def self.execute(id:, changes:)
        store = ::Store.includes(:financial_entries).find_by!(id: id)
        store.update(changes)

        store.decorate
      end
    end
  end
end

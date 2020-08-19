module Service
  module Store
    class Search
      def self.execute(**params)
        order = params.fetch(:order, 'created_at desc')

        ::Store.all.order(order)
      end
    end
  end
end

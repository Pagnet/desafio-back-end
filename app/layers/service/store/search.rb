module Service
  module Store
    class Search
      def self.execute(**params)
        order = params.fetch(:order, 'created_at desc')

        ::Store.all.order(order).decorate
      end
    end
  end
end

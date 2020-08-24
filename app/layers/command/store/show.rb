module Command
  module Store
    class Show
      attr_accessor :id

      def initialize(id:)
        @id = id
      end

      def execute
        Service::Store::Show.execute(id: @id)
      end
    end
  end
end

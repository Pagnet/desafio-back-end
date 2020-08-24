module Command
  module Store
    class Destroy
      attr_accessor :id

      def initialize(id:)
        @id = id
      end

      def execute
        Service::Store::Destroy.execute(id: @id)
      end
    end
  end
end

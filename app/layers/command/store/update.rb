module Command
  module Store
    class Update
      attr_accessor :id
      attr_accessor :changes

      def initialize(id:, changes:)
        @id = id
        @changes = changes
      end

      def execute
        Service::Store::Update.execute(id: @id, changes: changes)
      end
    end
  end
end

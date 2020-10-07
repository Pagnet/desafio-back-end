module Transaction::Publisher
  extend ActiveSupport::Concern

  included do
    @@events = {
      created_transaction: -> (body) { Transaction::UpdateBalanceJob.perform_later(body) },
    }

    def broadcast(trigger, body)
      return unless has_events?(trigger)

      run(trigger, body)
    end

    private
      def has_events?(trigger)
        @@events.keys.include?(trigger)
      end

      def run(trigger, body)
        @@events[trigger].call(body)
      end
  end
end

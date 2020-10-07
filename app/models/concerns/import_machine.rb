module ImportMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status do
      state :awaiting, initial: true
      state :running
      state :finished
      state :error

      event :run do
        transitions from: :awaiting, to: :running
      end

      event :finish do
        transitions from: :running, to: :finished
      end

      event :error do
        transitions from: [:awaiting, :running], to: :error
      end
    end
  end
end

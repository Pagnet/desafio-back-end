module ImportMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status do
      state :awaiting, initial: true
      state :processing
      state :finished
      state :error

      event :start do
        transitions from: :awaiting, to: :processing
      end

      event :finish do
        transitions from: [:awaiting, :processing], to: :finished
      end

      event :error do
        transitions from: [:awaiting, :processing], to: :error
      end
    end
  end
end

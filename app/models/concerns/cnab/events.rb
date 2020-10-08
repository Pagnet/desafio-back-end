module Cnab::Events
  extend ActiveSupport::Concern

  included do
    include Cnab::Publisher

    after_commit :created_import, on: :create
    before_create :set_name

    def created_import
      start!
      broadcast(:created_import, self)
    end

    def set_name
      self.name = SecureRandom.uuid
    end
  end
end

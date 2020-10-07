module Cnab::Events
  extend ActiveSupport::Concern

  included do
    include Cnab::Publisher
    after_create :created_import

    def created_import
      broadcast(:created_import, self)
    end
  end
end

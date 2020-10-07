class CnabImport < ApplicationRecord
  include Cnab::Events
  include ImportMachine

  has_one_attached :file
end

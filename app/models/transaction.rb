class Transaction < ApplicationRecord
  store_accessor :store_info, [:name, :owner_name]
  store_accessor :type_info, [:description, :kind]

  validates_presence_of :occurrence_datetime, :value, :beneficiary_document,
                        :credit_card_number, :name, :owner_name, :description,
                        :kind
end

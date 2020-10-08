# == Schema Information
#
# Table name: cnab_imports
#
#  id         :bigint           not null, primary key
#  name       :string
#  file       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CnabImport < ApplicationRecord
  include Cnab::Events
  include ImportMachine

  has_one_attached :file
  validates :file, presence: true
end

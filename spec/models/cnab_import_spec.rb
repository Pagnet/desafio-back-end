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
require 'rails_helper'

RSpec.describe CnabImport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: CnabImportation
#
#  id          :bigint           not null, primary key
#  status      :integer
#  file        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CnabImportation < ApplicationRecord

  enum status: {starting: 0, processing: 1, concluded: 2, failed: 3}

  validates :status, :file, presence: true

  def update_status(status)
    self.update(status: status)
  end

end
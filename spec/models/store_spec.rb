# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  it { is_expected.to have_many(:store_operations).dependent(:destroy) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :storekeeper }
end

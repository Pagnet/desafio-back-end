# frozen_string_literal: true

require 'rails_helper'

describe CnabParserService do
  describe "#call" do
    context 'with a valid file' do
      let(:file) { file_fixture("sample_file.txt")}

      subject do
        described_class.new(file: file).call
      end
      it { is_expected.to be(:success) }
    end
  end
end
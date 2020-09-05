require 'rails_helper'

describe ImporterService do
  subject(:service) { ImporterService.new(importer.id) }

  let(:importer) { create(:importer, file: file) }

  let(:file) do
    tempfile = Tempfile.new(['CNAB', '.txt'])
    File.open(tempfile.path, "w") { |f| f.write file_row }

    Rack::Test::UploadedFile.new(tempfile.path)
  end

  let(:file_row) { "3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       " }

  let(:parsed_row) { CnabParser.new(file.path).call[0] }

  describe 'call' do
    context 'with success' do
      context 'set status :success' do
        before { service.call }

        it { expect(importer.reload).to be_success }
      end

      it 'create operation' do
        expect do
          service.call
        end.to change(Operation, :count).by(1)
      end

      context 'create store' do
        it 'when not exists' do
          expect do
            service.call
          end.to change(Store, :count).by(1)
        end

        it 'when already exists' do
          create(:store, name: parsed_row[:store])

          expect do
            service.call
          end.to change(Store, :count).by(0)
        end
      end

      context 'set operation attributes' do
        let(:operation) { Operation.last }

        before { service.call }

        it { expect(operation.operation_type).to eq(parsed_row[:operation_type]) }
        it { expect(operation.occurred_at).to eq(parsed_row[:occurred_at]) }
        it { expect(operation.value).to eq(parsed_row[:value]) }
        it { expect(operation.cpf).to eq(parsed_row[:cpf]) }
        it { expect(operation.card_number).to eq(parsed_row[:card_number]) }
        it { expect(operation.owner).to eq(parsed_row[:owner]) }
        it { expect(operation.store.name).to eq(parsed_row[:store]) }
      end
    end

    context 'with error' do
      before do
        allow(Operation).to receive(:create!) { raise 'error message' }

        expect(Operation).to receive(:create!)
      end

      context 'set error status and message' do
        before { service.call }

        it { expect(importer.reload).to be_error }
        it { expect(importer.reload.error_message).to be_present }
      end

      context 'rollback any operation' do
        it { expect{ service.call }.to change(Operation, :count).by(0) }
      end
    end
  end
end

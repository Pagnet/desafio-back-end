require 'rails_helper'

RSpec.describe Operations::AttachedFile::Create do
  before do
    FileHandleWorker.clear
    allow(FileStorage).to receive_message_chain(:client).and_return(FileStorage::MockStorage.new)
  end

  let(:operation) { Operations::AttachedFile::Create.new }
  let(:valid_params) {
    {
      'kind' => 'CnabParser',
      'content_type' => 'text/plain',
      'filename' => 'CNAB.txt',
      'filepath' => "#{Rails.root}/spec/file_storage/attached_files/CNAB.txt"
    }
  }

  it 'when not step one kind should return an error' do
    result = operation.call(valid_params.merge('kind' => 'Foo'))
    expect(result.failure?).to be_truthy
    expect(result.translated_errors).to include(
      I18n.t(result.errors.first[:error_key], accepted_kinds: AttachedFile::KINDS.join(','), given_kind: 'Foo')
    )
  end

  it 'when not step one content_type should return an error' do
    result = operation.call(valid_params.merge('content_type' => 'Foo'))
    expect(result.failure?).to be_truthy
    expect(result.translated_errors).to include(
      I18n.t(result.errors.first[:error_key], accepted_types: AttachedFile::ACCEPTED_CONTENT_TYPES.join(','), given_type: 'Foo')
    )
  end

  it 'when not step one filepath should return an error' do
    result = operation.call(valid_params.merge('filepath' => 'Foo'))
    expect(result.failure?).to be_truthy
    expect(result.translated_errors).to include(
      I18n.t(result.errors.first[:error_key])
    )
  end

  it 'when step one filesize bigger then should return an error' do
    allow(File).to receive_message_chain(:size).and_return(100.megabytes)
    result = operation.call(valid_params)
    expect(result.failure?).to be_truthy
    expect(result.translated_errors).to include(
      I18n.t(result.errors.first[:error_key], max: "#{AttachedFile::MAX_FILE_SIZE / 1024 / 1024}MB")
    )
  end

  it 'creates an AttachedFile and enqueues to be processed' do
    result = operation.call(valid_params)
    attached_file = result.data[:attached_file]
    expect(result.success?).to be_truthy
    expect(attached_file).not_to be_nil
    jobs = FileHandleWorker.jobs
    job = jobs.first['args'].first
    expect(attached_file.id).to eq(job['attached_file_id'])
    expect(jobs.size).to eq(1)
  end
end
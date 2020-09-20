require 'rails_helper'

RSpec.describe AttachedFile, type: :model do
  let(:file) { build(:attached_file, filename: 'foo.txt') }
  let(:filepath) { "#{Rails.root}/spec/file_storage/attached_files/CNAB.txt" }

  before do
    allow(FileStorage).to receive_message_chain(:client).and_return(FileStorage::MockStorage.new)
  end

  it 'it saves a new file' do
    file.write_on_storage!('my content is good')
    file.save

    file.reload

    expect(file.id).not_to be_nil
    expect(file.read.string).to eq('my content is good')
    expect(file.filename).to eq('foo.txt')
    expect(file.filepath).to eq(filepath)
    expect('pending').to eq(file.status)
    expect(AttachedFile::KINDS.first).to eq(file.kind)
    expect("http://fake.s3.com.br/#{filepath}").to eq(file.file_url)
  end

  it 'it process a file given a processor' do
    file.write_on_storage!(File.read(filepath))
    file.save
    expect(file.status).to eq('pending')
    file.process
    expect(file.status).to eq('processed')
  end

  it 'it raises error for unknown kind processor' do
    file.filepath = filepath
    file.kind = 'FOO'
    file.save
    expect { file.process }.to raise_error(RuntimeError, "Couldn't find processor for attached_file '#{file.id}' kind '#{file.kind}'")
  end
end

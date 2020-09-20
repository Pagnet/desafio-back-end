require 'rails_helper'
RSpec.describe FileHandleWorker, type: :worker do
  before do
    described_class.clear
  end

  it 'when job run correct queue' do
    described_class.perform_async
    expect(:handle_file).to eq(described_class.queue)
  end

  it 'when job run should you have one job' do
    described_class.perform_async
    expect(described_class.jobs.size).to eq(1)
  end
end

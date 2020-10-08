require "rails_helper"

RSpec.describe CnabService do
  let(:line) {
    "2201903010000050200845152540738473****1231231233MARCOS PEREIRAMERCADO DA AVENIDA"
  }

  let(:service) {
    CnabService.new(line)
  }

  it { expect(service.send(:build_company)).to eq nil }
  it { expect(service.send(:normalize_date)).to eq "01-03-2019" }
  it { expect(service.send(:normalize_time)).to eq "23:12:33" }
  it {
    data = service.extract
    expect(data).to eq({
    transaction_kind_id: nil,
    exec_date: "01-03-2019",
    value_cents: 0,
    cpf: "845.152.540-73",
    card: "8473****1231",
    exec_time: "23:12:33",
    company_id: nil
  })}
end

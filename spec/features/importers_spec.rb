require "rails_helper"

describe "importers", type: :feature do
  let!(:importer) { FactoryBot.create(:importer) }

  it "list all importers" do
    visit importers_path
    expect(page.all(:css, "tr.importer").count).to eq(1)
  end
end
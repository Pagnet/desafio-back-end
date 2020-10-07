require 'rails_helper'

RSpec.describe "cnab_imports/show", type: :view do
  before(:each) do
    @cnab_import = assign(:cnab_import, CnabImport.create!(
      name: "Name",
      file: "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/File/)
  end
end

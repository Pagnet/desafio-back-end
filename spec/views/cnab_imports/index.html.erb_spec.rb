require 'rails_helper'

RSpec.describe "cnab_imports/index", type: :view do
  before(:each) do
    assign(:cnab_imports, [
      CnabImport.create!(
        name: "Name",
        file: "File"
      ),
      CnabImport.create!(
        name: "Name",
        file: "File"
      )
    ])
  end

  it "renders a list of cnab_imports" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "File".to_s, count: 2
  end
end

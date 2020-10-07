require 'rails_helper'

RSpec.describe "cnab_imports/edit", type: :view do
  before(:each) do
    @cnab_import = assign(:cnab_import, CnabImport.create!(
      name: "MyString",
      file: "MyString"
    ))
  end

  it "renders the edit cnab_import form" do
    render

    assert_select "form[action=?][method=?]", cnab_import_path(@cnab_import), "post" do

      assert_select "input[name=?]", "cnab_import[name]"

      assert_select "input[name=?]", "cnab_import[file]"
    end
  end
end

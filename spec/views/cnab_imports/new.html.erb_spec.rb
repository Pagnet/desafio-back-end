require 'rails_helper'

RSpec.describe "cnab_imports/new", type: :view do
  before(:each) do
    assign(:cnab_import, CnabImport.new(
      name: "MyString",
      file: "MyString"
    ))
  end

  it "renders new cnab_import form" do
    render

    assert_select "form[action=?][method=?]", cnab_imports_path, "post" do

      assert_select "input[name=?]", "cnab_import[name]"

      assert_select "input[name=?]", "cnab_import[file]"
    end
  end
end

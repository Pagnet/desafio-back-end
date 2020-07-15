require 'rails_helper'

RSpec.describe "file_importeds/new", type: :view do
  before(:each) do
    assign(:file_imported, FileImported.new())
  end

  it "renders new file_imported form" do
    render

    assert_select "form[action=?][method=?]", file_importeds_path, "post" do
    end
  end
end

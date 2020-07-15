require 'rails_helper'

RSpec.describe "file_importeds/index", type: :view do
  before(:each) do
    assign(:file_importeds, [
      FileImported.create!(),
      FileImported.create!()
    ])
  end

  it "renders a list of file_importeds" do
    render
  end
end

require 'rails_helper'

RSpec.describe 'file_importeds/index', type: :view do
  before do
    assign(:file_importeds, create_list(:file_imported, 2))
  end

  it 'renders a list of file_importeds' do
    render
    assert_select 'a[href=?]', new_file_imported_path
  end
end

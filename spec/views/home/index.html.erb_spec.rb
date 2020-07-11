require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'displays the given text' do
    render

    expect(rendered).to have_content('Upload')
  end

  it 'displays given elements' do
    render

    expect(rendered).to have_selector('input[type="file"]')
    expect(rendered).to have_selector('input[type="submit"]')
  end
end

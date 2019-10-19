require 'rails_helper'

RSpec.describe 'Transactions Index', type: :feature, js: true do
  let!(:page) { Pages::Transactions::Index.new }

  before do
    page.load
  end

  scenario 'Completed: Upload CNAB file' do
    page.file_input.set(Rails.root.join('CNAB.txt').to_s)
    page.submit.click

    page.wait_until_modal_completed_visible
    page.modal_completed.find('#reload').click
    expect(page).to have_current_path('/')

    page.wait_until_store_cards_visible
    expect(page).to have_store_cards(count: 5)
  end

  scenario 'Failed: Upload CNAB file' do
    page.file_input.set(Rails.root.join('README.md').to_s)
    page.submit.click

    page.wait_until_modal_failed_visible
    page.modal_failed.find('#close').click
    expect(page).to have_current_path('/')

    expect(page).to have_store_cards(count: 0)
  end

end
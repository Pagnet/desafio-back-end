# frozen_string_literal: true

require 'rails_helper'

describe "Root path test", type: :feature do
  let(:filename) { "sample_file.txt" }

  before(:each) do
    visit root_url
    page.attach_file(file_fixture(filename))
    click_button "Submit"
  end

  context "when the file is valid" do
    let(:filename) { "sample_file.txt" }
    it { expect(page).to have_text("File uploaded successfully") }
  end

  context "when the file is empty" do
    let(:filename) { "empty_file.txt" }
    it { expect(page).to have_text("File is empty") }
  end

  context "when the file type invalid" do
    let(:filename) { "pixel.png" }
    it { expect(page).to have_text("Invalid file type") }
  end
end

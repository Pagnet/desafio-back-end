require "application_system_test_case"

class ImportacaosTest < ApplicationSystemTestCase
  setup do
    @importacao = importacaos(:one)
  end

  test "visiting the index" do
    visit importacaos_url
    assert_selector "h1", text: "Importacaos"
  end

  test "creating a Importacao" do
    visit importacaos_url
    click_on "New Importacao"

    fill_in "Arquivo", with: @importacao.arquivo
    click_on "Create Importacao"

    assert_text "Importacao was successfully created"
    click_on "Back"
  end

  test "updating a Importacao" do
    visit importacaos_url
    click_on "Edit", match: :first

    fill_in "Arquivo", with: @importacao.arquivo
    click_on "Update Importacao"

    assert_text "Importacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Importacao" do
    visit importacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Importacao was successfully destroyed"
  end
end

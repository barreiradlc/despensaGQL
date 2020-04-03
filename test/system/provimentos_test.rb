require "application_system_test_case"

class ProvimentosTest < ApplicationSystemTestCase
  setup do
    @provimento = provimentos(:one)
  end

  test "visiting the index" do
    visit provimentos_url
    assert_selector "h1", text: "Provimentos"
  end

  test "creating a Provimento" do
    visit provimentos_url
    click_on "New Provimento"

    fill_in "Nome", with: @provimento.nome
    click_on "Create Provimento"

    assert_text "Provimento was successfully created"
    click_on "Back"
  end

  test "updating a Provimento" do
    visit provimentos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @provimento.nome
    click_on "Update Provimento"

    assert_text "Provimento was successfully updated"
    click_on "Back"
  end

  test "destroying a Provimento" do
    visit provimentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provimento was successfully destroyed"
  end
end

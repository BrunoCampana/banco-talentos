require "application_system_test_case"

class AreaatuacaosTest < ApplicationSystemTestCase
  setup do
    @areaatuacao = areaatuacaos(:one)
  end

  test "visiting the index" do
    visit areaatuacaos_url
    assert_selector "h1", text: "Areaatuacaos"
  end

  test "creating a Areaatuacao" do
    visit areaatuacaos_url
    click_on "New Areaatuacao"

    click_on "Create Areaatuacao"

    assert_text "Areaatuacao was successfully created"
    click_on "Back"
  end

  test "updating a Areaatuacao" do
    visit areaatuacaos_url
    click_on "Edit", match: :first

    click_on "Update Areaatuacao"

    assert_text "Areaatuacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Areaatuacao" do
    visit areaatuacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Areaatuacao was successfully destroyed"
  end
end

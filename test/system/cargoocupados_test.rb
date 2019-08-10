require "application_system_test_case"

class CargoocupadosTest < ApplicationSystemTestCase
  setup do
    @cargoocupado = cargoocupados(:one)
  end

  test "visiting the index" do
    visit cargoocupados_url
    assert_selector "h1", text: "Cargoocupados"
  end

  test "creating a Cargoocupado" do
    visit cargoocupados_url
    click_on "New Cargoocupado"

    click_on "Create Cargoocupado"

    assert_text "Cargoocupado was successfully created"
    click_on "Back"
  end

  test "updating a Cargoocupado" do
    visit cargoocupados_url
    click_on "Edit", match: :first

    click_on "Update Cargoocupado"

    assert_text "Cargoocupado was successfully updated"
    click_on "Back"
  end

  test "destroying a Cargoocupado" do
    visit cargoocupados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cargoocupado was successfully destroyed"
  end
end

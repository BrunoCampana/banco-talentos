require "application_system_test_case"

class HabilidadesTest < ApplicationSystemTestCase
  setup do
    @habilidade = habilidades(:one)
  end

  test "visiting the index" do
    visit habilidades_url
    assert_selector "h1", text: "Habilidades"
  end

  test "creating a Habilidade" do
    visit habilidades_url
    click_on "New Habilidade"

    click_on "Create Habilidade"

    assert_text "Habilidade was successfully created"
    click_on "Back"
  end

  test "updating a Habilidade" do
    visit habilidades_url
    click_on "Edit", match: :first

    click_on "Update Habilidade"

    assert_text "Habilidade was successfully updated"
    click_on "Back"
  end

  test "destroying a Habilidade" do
    visit habilidades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Habilidade was successfully destroyed"
  end
end

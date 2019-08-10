require "application_system_test_case"

class TalentosTest < ApplicationSystemTestCase
  setup do
    @talento = talentos(:one)
  end

  test "visiting the index" do
    visit talentos_url
    assert_selector "h1", text: "Talentos"
  end

  test "creating a Talento" do
    visit talentos_url
    click_on "New Talento"

    click_on "Create Talento"

    assert_text "Talento was successfully created"
    click_on "Back"
  end

  test "updating a Talento" do
    visit talentos_url
    click_on "Edit", match: :first

    click_on "Update Talento"

    assert_text "Talento was successfully updated"
    click_on "Back"
  end

  test "destroying a Talento" do
    visit talentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talento was successfully destroyed"
  end
end

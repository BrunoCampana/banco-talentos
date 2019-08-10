require "application_system_test_case"

class QuartelsTest < ApplicationSystemTestCase
  setup do
    @quartel = quartels(:one)
  end

  test "visiting the index" do
    visit quartels_url
    assert_selector "h1", text: "Quartels"
  end

  test "creating a Quartel" do
    visit quartels_url
    click_on "New Quartel"

    click_on "Create Quartel"

    assert_text "Quartel was successfully created"
    click_on "Back"
  end

  test "updating a Quartel" do
    visit quartels_url
    click_on "Edit", match: :first

    click_on "Update Quartel"

    assert_text "Quartel was successfully updated"
    click_on "Back"
  end

  test "destroying a Quartel" do
    visit quartels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quartel was successfully destroyed"
  end
end

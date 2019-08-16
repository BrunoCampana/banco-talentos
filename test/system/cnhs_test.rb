require "application_system_test_case"

class CnhsTest < ApplicationSystemTestCase
  setup do
    @cnh = cnhs(:one)
  end

  test "visiting the index" do
    visit cnhs_url
    assert_selector "h1", text: "Cnhs"
  end

  test "creating a Cnh" do
    visit cnhs_url
    click_on "New Cnh"

    click_on "Create Cnh"

    assert_text "Cnh was successfully created"
    click_on "Back"
  end

  test "updating a Cnh" do
    visit cnhs_url
    click_on "Edit", match: :first

    click_on "Update Cnh"

    assert_text "Cnh was successfully updated"
    click_on "Back"
  end

  test "destroying a Cnh" do
    visit cnhs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cnh was successfully destroyed"
  end
end

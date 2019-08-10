require "application_system_test_case"

class FormmilitarsTest < ApplicationSystemTestCase
  setup do
    @formmilitar = formmilitars(:one)
  end

  test "visiting the index" do
    visit formmilitars_url
    assert_selector "h1", text: "Formmilitars"
  end

  test "creating a Formmilitar" do
    visit formmilitars_url
    click_on "New Formmilitar"

    click_on "Create Formmilitar"

    assert_text "Formmilitar was successfully created"
    click_on "Back"
  end

  test "updating a Formmilitar" do
    visit formmilitars_url
    click_on "Edit", match: :first

    click_on "Update Formmilitar"

    assert_text "Formmilitar was successfully updated"
    click_on "Back"
  end

  test "destroying a Formmilitar" do
    visit formmilitars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formmilitar was successfully destroyed"
  end
end

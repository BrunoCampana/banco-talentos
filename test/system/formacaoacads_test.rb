require "application_system_test_case"

class FormacaoacadsTest < ApplicationSystemTestCase
  setup do
    @formacaoacad = formacaoacads(:one)
  end

  test "visiting the index" do
    visit formacaoacads_url
    assert_selector "h1", text: "Formacaoacads"
  end

  test "creating a Formacaoacad" do
    visit formacaoacads_url
    click_on "New Formacaoacad"

    click_on "Create Formacaoacad"

    assert_text "Formacaoacad was successfully created"
    click_on "Back"
  end

  test "updating a Formacaoacad" do
    visit formacaoacads_url
    click_on "Edit", match: :first

    click_on "Update Formacaoacad"

    assert_text "Formacaoacad was successfully updated"
    click_on "Back"
  end

  test "destroying a Formacaoacad" do
    visit formacaoacads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formacaoacad was successfully destroyed"
  end
end

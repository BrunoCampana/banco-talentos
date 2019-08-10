require "application_system_test_case"

class CertificacaosTest < ApplicationSystemTestCase
  setup do
    @certificacao = certificacaos(:one)
  end

  test "visiting the index" do
    visit certificacaos_url
    assert_selector "h1", text: "Certificacaos"
  end

  test "creating a Certificacao" do
    visit certificacaos_url
    click_on "New Certificacao"

    click_on "Create Certificacao"

    assert_text "Certificacao was successfully created"
    click_on "Back"
  end

  test "updating a Certificacao" do
    visit certificacaos_url
    click_on "Edit", match: :first

    click_on "Update Certificacao"

    assert_text "Certificacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Certificacao" do
    visit certificacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Certificacao was successfully destroyed"
  end
end

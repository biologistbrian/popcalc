require "application_system_test_case"

class SitefactorsTest < ApplicationSystemTestCase
  setup do
    @sitefactor = sitefactors(:one)
  end

  test "visiting the index" do
    visit sitefactors_url
    assert_selector "h1", text: "Sitefactors"
  end

  test "creating a Sitefactor" do
    visit sitefactors_url
    click_on "New Sitefactor"

    click_on "Create Sitefactor"

    assert_text "Sitefactor was successfully created"
    click_on "Back"
  end

  test "updating a Sitefactor" do
    visit sitefactors_url
    click_on "Edit", match: :first

    click_on "Update Sitefactor"

    assert_text "Sitefactor was successfully updated"
    click_on "Back"
  end

  test "destroying a Sitefactor" do
    visit sitefactors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sitefactor was successfully destroyed"
  end
end

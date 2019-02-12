require "application_system_test_case"

class ProjlinesTest < ApplicationSystemTestCase
  setup do
    @projline = projlines(:one)
  end

  test "visiting the index" do
    visit projlines_url
    assert_selector "h1", text: "Projlines"
  end

  test "creating a Projline" do
    visit projlines_url
    click_on "New Projline"

    click_on "Create Projline"

    assert_text "Projline was successfully created"
    click_on "Back"
  end

  test "updating a Projline" do
    visit projlines_url
    click_on "Edit", match: :first

    click_on "Update Projline"

    assert_text "Projline was successfully updated"
    click_on "Back"
  end

  test "destroying a Projline" do
    visit projlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Projline was successfully destroyed"
  end
end

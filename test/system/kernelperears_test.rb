require "application_system_test_case"

class KernelperearsTest < ApplicationSystemTestCase
  setup do
    @kernelperear = kernelperears(:one)
  end

  test "visiting the index" do
    visit kernelperears_url
    assert_selector "h1", text: "Kernelperears"
  end

  test "creating a Kernelperear" do
    visit kernelperears_url
    click_on "New Kernelperear"

    click_on "Create Kernelperear"

    assert_text "Kernelperear was successfully created"
    click_on "Back"
  end

  test "updating a Kernelperear" do
    visit kernelperears_url
    click_on "Edit", match: :first

    click_on "Update Kernelperear"

    assert_text "Kernelperear was successfully updated"
    click_on "Back"
  end

  test "destroying a Kernelperear" do
    visit kernelperears_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kernelperear was successfully destroyed"
  end
end

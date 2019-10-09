require "application_system_test_case"

class CommercesTest < ApplicationSystemTestCase
  setup do
    @commerce = commerces(:one)
  end

  test "visiting the index" do
    visit commerces_url
    assert_selector "h1", text: "Commerces"
  end

  test "creating a Commerce" do
    visit commerces_url
    click_on "New Commerce"

    fill_in "Adress", with: @commerce.adress
    fill_in "Name", with: @commerce.name
    fill_in "Number", with: @commerce.number
    fill_in "Rol", with: @commerce.rol
    click_on "Create Commerce"

    assert_text "Commerce was successfully created"
    click_on "Back"
  end

  test "updating a Commerce" do
    visit commerces_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @commerce.adress
    fill_in "Name", with: @commerce.name
    fill_in "Number", with: @commerce.number
    fill_in "Rol", with: @commerce.rol
    click_on "Update Commerce"

    assert_text "Commerce was successfully updated"
    click_on "Back"
  end

  test "destroying a Commerce" do
    visit commerces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commerce was successfully destroyed"
  end
end

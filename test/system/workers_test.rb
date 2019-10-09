require "application_system_test_case"

class WorkersTest < ApplicationSystemTestCase
  setup do
    @worker = workers(:one)
  end

  test "visiting the index" do
    visit workers_url
    assert_selector "h1", text: "Workers"
  end

  test "creating a Worker" do
    visit workers_url
    click_on "New Worker"

    check "Admin" if @worker.admin
    fill_in "Adress", with: @worker.adress
    fill_in "Name", with: @worker.name
    fill_in "Number", with: @worker.number
    fill_in "Office", with: @worker.office_id
    fill_in "Rol", with: @worker.rol
    click_on "Create Worker"

    assert_text "Worker was successfully created"
    click_on "Back"
  end

  test "updating a Worker" do
    visit workers_url
    click_on "Edit", match: :first

    check "Admin" if @worker.admin
    fill_in "Adress", with: @worker.adress
    fill_in "Name", with: @worker.name
    fill_in "Number", with: @worker.number
    fill_in "Office", with: @worker.office_id
    fill_in "Rol", with: @worker.rol
    click_on "Update Worker"

    assert_text "Worker was successfully updated"
    click_on "Back"
  end

  test "destroying a Worker" do
    visit workers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worker was successfully destroyed"
  end
end

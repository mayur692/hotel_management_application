require "application_system_test_case"

class StaffsTest < ApplicationSystemTestCase
  setup do
    @staff = staffs(:one)
  end

  test "visiting the index" do
    visit staffs_url
    assert_selector "h1", text: "Staffs"
  end

  test "should create staff" do
    visit staffs_url
    click_on "New staff"

    fill_in "Contact", with: @staff.contact
    fill_in "Hotel", with: @staff.hotel_id
    fill_in "Name", with: @staff.name
    fill_in "Salary", with: @staff.salary
    fill_in "Type", with: @staff.type
    click_on "Create Staff"

    assert_text "Staff was successfully created"
    click_on "Back"
  end

  test "should update Staff" do
    visit staff_url(@staff)
    click_on "Edit this staff", match: :first

    fill_in "Contact", with: @staff.contact
    fill_in "Hotel", with: @staff.hotel_id
    fill_in "Name", with: @staff.name
    fill_in "Salary", with: @staff.salary
    fill_in "Type", with: @staff.type
    click_on "Update Staff"

    assert_text "Staff was successfully updated"
    click_on "Back"
  end

  test "should destroy Staff" do
    visit staff_url(@staff)
    click_on "Destroy this staff", match: :first

    assert_text "Staff was successfully destroyed"
  end
end

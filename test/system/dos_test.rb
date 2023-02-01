require "application_system_test_case"

class DosTest < ApplicationSystemTestCase
  setup do
    @do = dos(:one)
  end

  test "visiting the index" do
    visit dos_url
    assert_selector "h1", text: "Dos"
  end

  test "creating a Do" do
    visit dos_url
    click_on "New Do"

    fill_in "Content", with: @do.content
    check "Done" if @do.done
    fill_in "Goal", with: @do.goal_id
    fill_in "Position", with: @do.position
    click_on "Create Do"

    assert_text "Do was successfully created"
    click_on "Back"
  end

  test "updating a Do" do
    visit dos_url
    click_on "Edit", match: :first

    fill_in "Content", with: @do.content
    check "Done" if @do.done
    fill_in "Goal", with: @do.goal_id
    fill_in "Position", with: @do.position
    click_on "Update Do"

    assert_text "Do was successfully updated"
    click_on "Back"
  end

  test "destroying a Do" do
    visit dos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Do was successfully destroyed"
  end
end

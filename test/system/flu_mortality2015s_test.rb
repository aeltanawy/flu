require "application_system_test_case"

class FluMortality2015sTest < ApplicationSystemTestCase
  setup do
    @flu_mortality2015 = flu_mortality2015s(:one)
  end

  test "visiting the index" do
    visit flu_mortality2015s_url
    assert_selector "h1", text: "Flu Mortality2015s"
  end

  test "creating a Flu mortality2015" do
    visit flu_mortality2015s_url
    click_on "New Flu Mortality2015"

    fill_in "Deaths", with: @flu_mortality2015.deaths
    fill_in "State", with: @flu_mortality2015.state_id
    click_on "Create Flu mortality2015"

    assert_text "Flu mortality2015 was successfully created"
    click_on "Back"
  end

  test "updating a Flu mortality2015" do
    visit flu_mortality2015s_url
    click_on "Edit", match: :first

    fill_in "Deaths", with: @flu_mortality2015.deaths
    fill_in "State", with: @flu_mortality2015.state_id
    click_on "Update Flu mortality2015"

    assert_text "Flu mortality2015 was successfully updated"
    click_on "Back"
  end

  test "destroying a Flu mortality2015" do
    visit flu_mortality2015s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flu mortality2015 was successfully destroyed"
  end
end

require "application_system_test_case"

class FluMortality2014sTest < ApplicationSystemTestCase
  setup do
    @flu_mortality2014 = flu_mortality2014s(:one)
  end

  test "visiting the index" do
    visit flu_mortality2014s_url
    assert_selector "h1", text: "Flu Mortality2014s"
  end

  test "creating a Flu mortality2014" do
    visit flu_mortality2014s_url
    click_on "New Flu Mortality2014"

    fill_in "Deaths", with: @flu_mortality2014.deaths
    fill_in "State", with: @flu_mortality2014.state_id
    click_on "Create Flu mortality2014"

    assert_text "Flu mortality2014 was successfully created"
    click_on "Back"
  end

  test "updating a Flu mortality2014" do
    visit flu_mortality2014s_url
    click_on "Edit", match: :first

    fill_in "Deaths", with: @flu_mortality2014.deaths
    fill_in "State", with: @flu_mortality2014.state_id
    click_on "Update Flu mortality2014"

    assert_text "Flu mortality2014 was successfully updated"
    click_on "Back"
  end

  test "destroying a Flu mortality2014" do
    visit flu_mortality2014s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flu mortality2014 was successfully destroyed"
  end
end

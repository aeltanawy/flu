require "application_system_test_case"

class StatePopulationsTest < ApplicationSystemTestCase
  setup do
    @state_population = state_populations(:one)
  end

  test "visiting the index" do
    visit state_populations_url
    assert_selector "h1", text: "State Populations"
  end

  test "creating a State population" do
    visit state_populations_url
    click_on "New State Population"

    fill_in "Number", with: @state_population.number
    fill_in "State", with: @state_population.state_id
    fill_in "Year", with: @state_population.year
    click_on "Create State population"

    assert_text "State population was successfully created"
    click_on "Back"
  end

  test "updating a State population" do
    visit state_populations_url
    click_on "Edit", match: :first

    fill_in "Number", with: @state_population.number
    fill_in "State", with: @state_population.state_id
    fill_in "Year", with: @state_population.year
    click_on "Update State population"

    assert_text "State population was successfully updated"
    click_on "Back"
  end

  test "destroying a State population" do
    visit state_populations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "State population was successfully destroyed"
  end
end

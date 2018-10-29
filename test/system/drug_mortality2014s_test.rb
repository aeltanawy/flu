require "application_system_test_case"

class DrugMortality2014sTest < ApplicationSystemTestCase
  setup do
    @drug_mortality2014 = drug_mortality2014s(:one)
  end

  test "visiting the index" do
    visit drug_mortality2014s_url
    assert_selector "h1", text: "Drug Mortality2014s"
  end

  test "creating a Drug mortality2014" do
    visit drug_mortality2014s_url
    click_on "New Drug Mortality2014"

    fill_in "Deaths", with: @drug_mortality2014.deaths
    fill_in "Per Num Pop", with: @drug_mortality2014.per_num_pop
    fill_in "State", with: @drug_mortality2014.state_id
    click_on "Create Drug mortality2014"

    assert_text "Drug mortality2014 was successfully created"
    click_on "Back"
  end

  test "updating a Drug mortality2014" do
    visit drug_mortality2014s_url
    click_on "Edit", match: :first

    fill_in "Deaths", with: @drug_mortality2014.deaths
    fill_in "Per Num Pop", with: @drug_mortality2014.per_num_pop
    fill_in "State", with: @drug_mortality2014.state_id
    click_on "Update Drug mortality2014"

    assert_text "Drug mortality2014 was successfully updated"
    click_on "Back"
  end

  test "destroying a Drug mortality2014" do
    visit drug_mortality2014s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drug mortality2014 was successfully destroyed"
  end
end

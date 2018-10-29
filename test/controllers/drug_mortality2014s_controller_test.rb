require 'test_helper'

class DrugMortality2014sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug_mortality2014 = drug_mortality2014s(:one)
  end

  test "should get index" do
    get drug_mortality2014s_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_mortality2014_url
    assert_response :success
  end

  test "should create drug_mortality2014" do
    assert_difference('DrugMortality2014.count') do
      post drug_mortality2014s_url, params: { drug_mortality2014: { deaths: @drug_mortality2014.deaths, per_num_pop: @drug_mortality2014.per_num_pop, state_id: @drug_mortality2014.state_id } }
    end

    assert_redirected_to drug_mortality2014_url(DrugMortality2014.last)
  end

  test "should show drug_mortality2014" do
    get drug_mortality2014_url(@drug_mortality2014)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_mortality2014_url(@drug_mortality2014)
    assert_response :success
  end

  test "should update drug_mortality2014" do
    patch drug_mortality2014_url(@drug_mortality2014), params: { drug_mortality2014: { deaths: @drug_mortality2014.deaths, per_num_pop: @drug_mortality2014.per_num_pop, state_id: @drug_mortality2014.state_id } }
    assert_redirected_to drug_mortality2014_url(@drug_mortality2014)
  end

  test "should destroy drug_mortality2014" do
    assert_difference('DrugMortality2014.count', -1) do
      delete drug_mortality2014_url(@drug_mortality2014)
    end

    assert_redirected_to drug_mortality2014s_url
  end
end

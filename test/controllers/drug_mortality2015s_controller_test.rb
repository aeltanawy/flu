require 'test_helper'

class DrugMortality2015sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug_mortality2015 = drug_mortality2015s(:one)
  end

  test "should get index" do
    get drug_mortality2015s_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_mortality2015_url
    assert_response :success
  end

  test "should create drug_mortality2015" do
    assert_difference('DrugMortality2015.count') do
      post drug_mortality2015s_url, params: { drug_mortality2015: { deaths: @drug_mortality2015.deaths, per_num_pop: @drug_mortality2015.per_num_pop, state_id: @drug_mortality2015.state_id } }
    end

    assert_redirected_to drug_mortality2015_url(DrugMortality2015.last)
  end

  test "should show drug_mortality2015" do
    get drug_mortality2015_url(@drug_mortality2015)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_mortality2015_url(@drug_mortality2015)
    assert_response :success
  end

  test "should update drug_mortality2015" do
    patch drug_mortality2015_url(@drug_mortality2015), params: { drug_mortality2015: { deaths: @drug_mortality2015.deaths, per_num_pop: @drug_mortality2015.per_num_pop, state_id: @drug_mortality2015.state_id } }
    assert_redirected_to drug_mortality2015_url(@drug_mortality2015)
  end

  test "should destroy drug_mortality2015" do
    assert_difference('DrugMortality2015.count', -1) do
      delete drug_mortality2015_url(@drug_mortality2015)
    end

    assert_redirected_to drug_mortality2015s_url
  end
end

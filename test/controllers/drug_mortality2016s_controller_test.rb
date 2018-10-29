require 'test_helper'

class DrugMortality2016sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug_mortality2016 = drug_mortality2016s(:one)
  end

  test "should get index" do
    get drug_mortality2016s_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_mortality2016_url
    assert_response :success
  end

  test "should create drug_mortality2016" do
    assert_difference('DrugMortality2016.count') do
      post drug_mortality2016s_url, params: { drug_mortality2016: { deaths: @drug_mortality2016.deaths, per_num_pop: @drug_mortality2016.per_num_pop, state_id: @drug_mortality2016.state_id } }
    end

    assert_redirected_to drug_mortality2016_url(DrugMortality2016.last)
  end

  test "should show drug_mortality2016" do
    get drug_mortality2016_url(@drug_mortality2016)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_mortality2016_url(@drug_mortality2016)
    assert_response :success
  end

  test "should update drug_mortality2016" do
    patch drug_mortality2016_url(@drug_mortality2016), params: { drug_mortality2016: { deaths: @drug_mortality2016.deaths, per_num_pop: @drug_mortality2016.per_num_pop, state_id: @drug_mortality2016.state_id } }
    assert_redirected_to drug_mortality2016_url(@drug_mortality2016)
  end

  test "should destroy drug_mortality2016" do
    assert_difference('DrugMortality2016.count', -1) do
      delete drug_mortality2016_url(@drug_mortality2016)
    end

    assert_redirected_to drug_mortality2016s_url
  end
end

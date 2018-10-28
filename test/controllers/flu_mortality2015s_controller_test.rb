require 'test_helper'

class FluMortality2015sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flu_mortality2015 = flu_mortality2015s(:one)
  end

  test "should get index" do
    get flu_mortality2015s_url
    assert_response :success
  end

  test "should get new" do
    get new_flu_mortality2015_url
    assert_response :success
  end

  test "should create flu_mortality2015" do
    assert_difference('FluMortality2015.count') do
      post flu_mortality2015s_url, params: { flu_mortality2015: { deaths: @flu_mortality2015.deaths, state_id: @flu_mortality2015.state_id } }
    end

    assert_redirected_to flu_mortality2015_url(FluMortality2015.last)
  end

  test "should show flu_mortality2015" do
    get flu_mortality2015_url(@flu_mortality2015)
    assert_response :success
  end

  test "should get edit" do
    get edit_flu_mortality2015_url(@flu_mortality2015)
    assert_response :success
  end

  test "should update flu_mortality2015" do
    patch flu_mortality2015_url(@flu_mortality2015), params: { flu_mortality2015: { deaths: @flu_mortality2015.deaths, state_id: @flu_mortality2015.state_id } }
    assert_redirected_to flu_mortality2015_url(@flu_mortality2015)
  end

  test "should destroy flu_mortality2015" do
    assert_difference('FluMortality2015.count', -1) do
      delete flu_mortality2015_url(@flu_mortality2015)
    end

    assert_redirected_to flu_mortality2015s_url
  end
end

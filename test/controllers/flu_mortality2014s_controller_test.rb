require 'test_helper'

class FluMortality2014sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flu_mortality2014 = flu_mortality2014s(:one)
  end

  test "should get index" do
    get flu_mortality2014s_url
    assert_response :success
  end

  test "should get new" do
    get new_flu_mortality2014_url
    assert_response :success
  end

  test "should create flu_mortality2014" do
    assert_difference('FluMortality2014.count') do
      post flu_mortality2014s_url, params: { flu_mortality2014: { deaths: @flu_mortality2014.deaths, state_id: @flu_mortality2014.state_id } }
    end

    assert_redirected_to flu_mortality2014_url(FluMortality2014.last)
  end

  test "should show flu_mortality2014" do
    get flu_mortality2014_url(@flu_mortality2014)
    assert_response :success
  end

  test "should get edit" do
    get edit_flu_mortality2014_url(@flu_mortality2014)
    assert_response :success
  end

  test "should update flu_mortality2014" do
    patch flu_mortality2014_url(@flu_mortality2014), params: { flu_mortality2014: { deaths: @flu_mortality2014.deaths, state_id: @flu_mortality2014.state_id } }
    assert_redirected_to flu_mortality2014_url(@flu_mortality2014)
  end

  test "should destroy flu_mortality2014" do
    assert_difference('FluMortality2014.count', -1) do
      delete flu_mortality2014_url(@flu_mortality2014)
    end

    assert_redirected_to flu_mortality2014s_url
  end
end

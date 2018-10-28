require 'test_helper'

class FluMortality2016sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flu_mortality2016 = flu_mortality2016s(:one)
  end

  test "should get index" do
    get flu_mortality2016s_url
    assert_response :success
  end

  test "should get new" do
    get new_flu_mortality2016_url
    assert_response :success
  end

  test "should create flu_mortality2016" do
    assert_difference('FluMortality2016.count') do
      post flu_mortality2016s_url, params: { flu_mortality2016: { deaths: @flu_mortality2016.deaths, state_id: @flu_mortality2016.state_id } }
    end

    assert_redirected_to flu_mortality2016_url(FluMortality2016.last)
  end

  test "should show flu_mortality2016" do
    get flu_mortality2016_url(@flu_mortality2016)
    assert_response :success
  end

  test "should get edit" do
    get edit_flu_mortality2016_url(@flu_mortality2016)
    assert_response :success
  end

  test "should update flu_mortality2016" do
    patch flu_mortality2016_url(@flu_mortality2016), params: { flu_mortality2016: { deaths: @flu_mortality2016.deaths, state_id: @flu_mortality2016.state_id } }
    assert_redirected_to flu_mortality2016_url(@flu_mortality2016)
  end

  test "should destroy flu_mortality2016" do
    assert_difference('FluMortality2016.count', -1) do
      delete flu_mortality2016_url(@flu_mortality2016)
    end

    assert_redirected_to flu_mortality2016s_url
  end
end

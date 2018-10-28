require 'test_helper'

class StatePopulationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_population = state_populations(:one)
  end

  test "should get index" do
    get state_populations_url
    assert_response :success
  end

  test "should get new" do
    get new_state_population_url
    assert_response :success
  end

  test "should create state_population" do
    assert_difference('StatePopulation.count') do
      post state_populations_url, params: { state_population: { number: @state_population.number, state_id: @state_population.state_id, year: @state_population.year } }
    end

    assert_redirected_to state_population_url(StatePopulation.last)
  end

  test "should show state_population" do
    get state_population_url(@state_population)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_population_url(@state_population)
    assert_response :success
  end

  test "should update state_population" do
    patch state_population_url(@state_population), params: { state_population: { number: @state_population.number, state_id: @state_population.state_id, year: @state_population.year } }
    assert_redirected_to state_population_url(@state_population)
  end

  test "should destroy state_population" do
    assert_difference('StatePopulation.count', -1) do
      delete state_population_url(@state_population)
    end

    assert_redirected_to state_populations_url
  end
end

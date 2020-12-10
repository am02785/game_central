require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get search" do
    get search_url
    assert_response :success
  end

  test "should get nintendo_switch_games" do
    get nintendo_switch_games_url
    assert_response :success
  end

  test "should get ps5_games" do
    get ps5_games_url
    assert_response :success
  end

  test "should get xbox_series_x_games" do
    get xbox_series_x_games_url
    assert_response :success
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end
end

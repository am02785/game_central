require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'a.show_game'
    assert_select 'image'
    assert_select 'p', 'game1'
  end


  test "should get nintendo_switch_games" do
    get nintendo_switch_games_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'a.show_game'
    assert_select 'image'
    assert_select 'p', 'game1'
  end

  test "should get ps5_games" do
    @game = games(:two)

    get ps5_games_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'a.show_game'
    assert_select 'image'
    assert_select 'p', 'game2'
  end

  test "should get xbox_series_x_games" do
    @game = games(:three)

    get xbox_series_x_games_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'a.show_game'
    assert_select 'image'
    assert_select 'p', 'game3'
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Game Central'
    assert_select 'image'
    assert_select 'div#game_info' do
      assert_select 'h1', @game.title
      assert_select 'h4', 'Price: £' + @game.price.to_s
      assert_select 'h4', 'Game Console: ' + @game.game_console
      assert_select 'h2', 'Description'
      assert_select 'p', @game.description
      assert_select 'h4', 'Release Date: ' + @game.release_date.wday.to_s + '/' + @game.release_date.mon.to_s + '/' + @game.release_date.year.to_s
      assert_select 'div#add_to_basket_button' do
        assert_select 'p' do
          assert_select 'a#add_to_basket_link', 'Add To Basket'
        end
      end
    end
  end
end

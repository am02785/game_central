require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "creating a Game" do
    visit games_url
    click_on "New Game"

    fill_in "Description", with: @game.description
    fill_in "Image url", with: @game.image_url
    fill_in "Price", with: @game.price
    fill_in "Release date", with: @game.release_date
    fill_in "Title", with: @game.title
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "updating a Game" do
    visit games_url
    click_on "Edit", match: :first

    fill_in "Description", with: @game.description
    fill_in "Image url", with: @game.image_url
    fill_in "Price", with: @game.price
    fill_in "Release date", with: @game.release_date
    fill_in "Title", with: @game.title
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "destroying a Game" do
    visit games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game was successfully destroyed"
  end
end

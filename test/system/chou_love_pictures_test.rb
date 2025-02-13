require "application_system_test_case"

class ChouLovePicturesTest < ApplicationSystemTestCase
  setup do
    @chou_love_picture = chou_love_pictures(:one)
  end

  test "visiting the index" do
    visit chou_love_pictures_url
    assert_selector "h1", text: "Chou love pictures"
  end

  test "should create chou love picture" do
    visit chou_love_pictures_url
    click_on "New chou love picture"

    fill_in "File path", with: @chou_love_picture.file_path
    fill_in "Latitude", with: @chou_love_picture.latitude
    fill_in "Longitude", with: @chou_love_picture.longitude
    fill_in "Name", with: @chou_love_picture.name
    click_on "Create Chou love picture"

    assert_text "Chou love picture was successfully created"
    click_on "Back"
  end

  test "should update Chou love picture" do
    visit chou_love_picture_url(@chou_love_picture)
    click_on "Edit this chou love picture", match: :first

    fill_in "File path", with: @chou_love_picture.file_path
    fill_in "Latitude", with: @chou_love_picture.latitude
    fill_in "Longitude", with: @chou_love_picture.longitude
    fill_in "Name", with: @chou_love_picture.name
    click_on "Update Chou love picture"

    assert_text "Chou love picture was successfully updated"
    click_on "Back"
  end

  test "should destroy Chou love picture" do
    visit chou_love_picture_url(@chou_love_picture)
    click_on "Destroy this chou love picture", match: :first

    assert_text "Chou love picture was successfully destroyed"
  end
end

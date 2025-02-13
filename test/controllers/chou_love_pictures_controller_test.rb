require "test_helper"

class ChouLovePicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chou_love_picture = chou_love_pictures(:one)
  end

  test "should get index" do
    get chou_love_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_chou_love_picture_url
    assert_response :success
  end

  test "should create chou_love_picture" do
    assert_difference("ChouLovePicture.count") do
      post chou_love_pictures_url, params: { chou_love_picture: { file_path: @chou_love_picture.file_path, latitude: @chou_love_picture.latitude, longitude: @chou_love_picture.longitude, name: @chou_love_picture.name } }
    end

    assert_redirected_to chou_love_picture_url(ChouLovePicture.last)
  end

  test "should show chou_love_picture" do
    get chou_love_picture_url(@chou_love_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_chou_love_picture_url(@chou_love_picture)
    assert_response :success
  end

  test "should update chou_love_picture" do
    patch chou_love_picture_url(@chou_love_picture), params: { chou_love_picture: { file_path: @chou_love_picture.file_path, latitude: @chou_love_picture.latitude, longitude: @chou_love_picture.longitude, name: @chou_love_picture.name } }
    assert_redirected_to chou_love_picture_url(@chou_love_picture)
  end

  test "should destroy chou_love_picture" do
    assert_difference("ChouLovePicture.count", -1) do
      delete chou_love_picture_url(@chou_love_picture)
    end

    assert_redirected_to chou_love_pictures_url
  end
end

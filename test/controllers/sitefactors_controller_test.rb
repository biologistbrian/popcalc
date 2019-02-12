require 'test_helper'

class SitefactorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sitefactor = sitefactors(:one)
  end

  test "should get index" do
    get sitefactors_url
    assert_response :success
  end

  test "should get new" do
    get new_sitefactor_url
    assert_response :success
  end

  test "should create sitefactor" do
    assert_difference('Sitefactor.count') do
      post sitefactors_url, params: { sitefactor: {  } }
    end

    assert_redirected_to sitefactor_url(Sitefactor.last)
  end

  test "should show sitefactor" do
    get sitefactor_url(@sitefactor)
    assert_response :success
  end

  test "should get edit" do
    get edit_sitefactor_url(@sitefactor)
    assert_response :success
  end

  test "should update sitefactor" do
    patch sitefactor_url(@sitefactor), params: { sitefactor: {  } }
    assert_redirected_to sitefactor_url(@sitefactor)
  end

  test "should destroy sitefactor" do
    assert_difference('Sitefactor.count', -1) do
      delete sitefactor_url(@sitefactor)
    end

    assert_redirected_to sitefactors_url
  end
end

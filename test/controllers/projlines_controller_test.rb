require 'test_helper'

class ProjlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projline = projlines(:one)
  end

  test "should get index" do
    get projlines_url
    assert_response :success
  end

  test "should get new" do
    get new_projline_url
    assert_response :success
  end

  test "should create projline" do
    assert_difference('Projline.count') do
      post projlines_url, params: { projline: {  } }
    end

    assert_redirected_to projline_url(Projline.last)
  end

  test "should show projline" do
    get projline_url(@projline)
    assert_response :success
  end

  test "should get edit" do
    get edit_projline_url(@projline)
    assert_response :success
  end

  test "should update projline" do
    patch projline_url(@projline), params: { projline: {  } }
    assert_redirected_to projline_url(@projline)
  end

  test "should destroy projline" do
    assert_difference('Projline.count', -1) do
      delete projline_url(@projline)
    end

    assert_redirected_to projlines_url
  end
end

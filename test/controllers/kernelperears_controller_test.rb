require 'test_helper'

class KernelperearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kernelperear = kernelperears(:one)
  end

  test "should get index" do
    get kernelperears_url
    assert_response :success
  end

  test "should get new" do
    get new_kernelperear_url
    assert_response :success
  end

  test "should create kernelperear" do
    assert_difference('Kernelperear.count') do
      post kernelperears_url, params: { kernelperear: {  } }
    end

    assert_redirected_to kernelperear_url(Kernelperear.last)
  end

  test "should show kernelperear" do
    get kernelperear_url(@kernelperear)
    assert_response :success
  end

  test "should get edit" do
    get edit_kernelperear_url(@kernelperear)
    assert_response :success
  end

  test "should update kernelperear" do
    patch kernelperear_url(@kernelperear), params: { kernelperear: {  } }
    assert_redirected_to kernelperear_url(@kernelperear)
  end

  test "should destroy kernelperear" do
    assert_difference('Kernelperear.count', -1) do
      delete kernelperear_url(@kernelperear)
    end

    assert_redirected_to kernelperears_url
  end
end

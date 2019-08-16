require 'test_helper'

class CnhsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cnh = cnhs(:one)
  end

  test "should get index" do
    get cnhs_url
    assert_response :success
  end

  test "should get new" do
    get new_cnh_url
    assert_response :success
  end

  test "should create cnh" do
    assert_difference('Cnh.count') do
      post cnhs_url, params: { cnh: {  } }
    end

    assert_redirected_to cnh_url(Cnh.last)
  end

  test "should show cnh" do
    get cnh_url(@cnh)
    assert_response :success
  end

  test "should get edit" do
    get edit_cnh_url(@cnh)
    assert_response :success
  end

  test "should update cnh" do
    patch cnh_url(@cnh), params: { cnh: {  } }
    assert_redirected_to cnh_url(@cnh)
  end

  test "should destroy cnh" do
    assert_difference('Cnh.count', -1) do
      delete cnh_url(@cnh)
    end

    assert_redirected_to cnhs_url
  end
end

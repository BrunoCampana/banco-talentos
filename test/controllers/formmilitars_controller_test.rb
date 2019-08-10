require 'test_helper'

class FormmilitarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formmilitar = formmilitars(:one)
  end

  test "should get index" do
    get formmilitars_url
    assert_response :success
  end

  test "should get new" do
    get new_formmilitar_url
    assert_response :success
  end

  test "should create formmilitar" do
    assert_difference('Formmilitar.count') do
      post formmilitars_url, params: { formmilitar: {  } }
    end

    assert_redirected_to formmilitar_url(Formmilitar.last)
  end

  test "should show formmilitar" do
    get formmilitar_url(@formmilitar)
    assert_response :success
  end

  test "should get edit" do
    get edit_formmilitar_url(@formmilitar)
    assert_response :success
  end

  test "should update formmilitar" do
    patch formmilitar_url(@formmilitar), params: { formmilitar: {  } }
    assert_redirected_to formmilitar_url(@formmilitar)
  end

  test "should destroy formmilitar" do
    assert_difference('Formmilitar.count', -1) do
      delete formmilitar_url(@formmilitar)
    end

    assert_redirected_to formmilitars_url
  end
end

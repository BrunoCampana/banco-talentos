require 'test_helper'

class FormacaoacadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formacaoacad = formacaoacads(:one)
  end

  test "should get index" do
    get formacaoacads_url
    assert_response :success
  end

  test "should get new" do
    get new_formacaoacad_url
    assert_response :success
  end

  test "should create formacaoacad" do
    assert_difference('Formacaoacad.count') do
      post formacaoacads_url, params: { formacaoacad: {  } }
    end

    assert_redirected_to formacaoacad_url(Formacaoacad.last)
  end

  test "should show formacaoacad" do
    get formacaoacad_url(@formacaoacad)
    assert_response :success
  end

  test "should get edit" do
    get edit_formacaoacad_url(@formacaoacad)
    assert_response :success
  end

  test "should update formacaoacad" do
    patch formacaoacad_url(@formacaoacad), params: { formacaoacad: {  } }
    assert_redirected_to formacaoacad_url(@formacaoacad)
  end

  test "should destroy formacaoacad" do
    assert_difference('Formacaoacad.count', -1) do
      delete formacaoacad_url(@formacaoacad)
    end

    assert_redirected_to formacaoacads_url
  end
end

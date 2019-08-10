require 'test_helper'

class QuartelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quartel = quartels(:one)
  end

  test "should get index" do
    get quartels_url
    assert_response :success
  end

  test "should get new" do
    get new_quartel_url
    assert_response :success
  end

  test "should create quartel" do
    assert_difference('Quartel.count') do
      post quartels_url, params: { quartel: {  } }
    end

    assert_redirected_to quartel_url(Quartel.last)
  end

  test "should show quartel" do
    get quartel_url(@quartel)
    assert_response :success
  end

  test "should get edit" do
    get edit_quartel_url(@quartel)
    assert_response :success
  end

  test "should update quartel" do
    patch quartel_url(@quartel), params: { quartel: {  } }
    assert_redirected_to quartel_url(@quartel)
  end

  test "should destroy quartel" do
    assert_difference('Quartel.count', -1) do
      delete quartel_url(@quartel)
    end

    assert_redirected_to quartels_url
  end
end

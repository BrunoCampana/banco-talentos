require 'test_helper'

class TalentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talento = talentos(:one)
  end

  test "should get index" do
    get talentos_url
    assert_response :success
  end

  test "should get new" do
    get new_talento_url
    assert_response :success
  end

  test "should create talento" do
    assert_difference('Talento.count') do
      post talentos_url, params: { talento: {  } }
    end

    assert_redirected_to talento_url(Talento.last)
  end

  test "should show talento" do
    get talento_url(@talento)
    assert_response :success
  end

  test "should get edit" do
    get edit_talento_url(@talento)
    assert_response :success
  end

  test "should update talento" do
    patch talento_url(@talento), params: { talento: {  } }
    assert_redirected_to talento_url(@talento)
  end

  test "should destroy talento" do
    assert_difference('Talento.count', -1) do
      delete talento_url(@talento)
    end

    assert_redirected_to talentos_url
  end
end

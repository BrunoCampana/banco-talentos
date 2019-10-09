require 'test_helper'

class RecrutamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recrutamento = recrutamentos(:one)
  end

  test "should get index" do
    get recrutamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_recrutamento_url
    assert_response :success
  end

  test "should create recrutamento" do
    assert_difference('Recrutamento.count') do
      post recrutamentos_url, params: { recrutamento: {  } }
    end

    assert_redirected_to recrutamento_url(Recrutamento.last)
  end

  test "should show recrutamento" do
    get recrutamento_url(@recrutamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_recrutamento_url(@recrutamento)
    assert_response :success
  end

  test "should update recrutamento" do
    patch recrutamento_url(@recrutamento), params: { recrutamento: {  } }
    assert_redirected_to recrutamento_url(@recrutamento)
  end

  test "should destroy recrutamento" do
    assert_difference('Recrutamento.count', -1) do
      delete recrutamento_url(@recrutamento)
    end

    assert_redirected_to recrutamentos_url
  end
end

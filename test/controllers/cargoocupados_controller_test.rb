require 'test_helper'

class CargoocupadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cargoocupado = cargoocupados(:one)
  end

  test "should get index" do
    get cargoocupados_url
    assert_response :success
  end

  test "should get new" do
    get new_cargoocupado_url
    assert_response :success
  end

  test "should create cargoocupado" do
    assert_difference('Cargoocupado.count') do
      post cargoocupados_url, params: { cargoocupado: {  } }
    end

    assert_redirected_to cargoocupado_url(Cargoocupado.last)
  end

  test "should show cargoocupado" do
    get cargoocupado_url(@cargoocupado)
    assert_response :success
  end

  test "should get edit" do
    get edit_cargoocupado_url(@cargoocupado)
    assert_response :success
  end

  test "should update cargoocupado" do
    patch cargoocupado_url(@cargoocupado), params: { cargoocupado: {  } }
    assert_redirected_to cargoocupado_url(@cargoocupado)
  end

  test "should destroy cargoocupado" do
    assert_difference('Cargoocupado.count', -1) do
      delete cargoocupado_url(@cargoocupado)
    end

    assert_redirected_to cargoocupados_url
  end
end

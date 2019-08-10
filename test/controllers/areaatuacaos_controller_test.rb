require 'test_helper'

class AreaatuacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @areaatuacao = areaatuacaos(:one)
  end

  test "should get index" do
    get areaatuacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_areaatuacao_url
    assert_response :success
  end

  test "should create areaatuacao" do
    assert_difference('Areaatuacao.count') do
      post areaatuacaos_url, params: { areaatuacao: {  } }
    end

    assert_redirected_to areaatuacao_url(Areaatuacao.last)
  end

  test "should show areaatuacao" do
    get areaatuacao_url(@areaatuacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_areaatuacao_url(@areaatuacao)
    assert_response :success
  end

  test "should update areaatuacao" do
    patch areaatuacao_url(@areaatuacao), params: { areaatuacao: {  } }
    assert_redirected_to areaatuacao_url(@areaatuacao)
  end

  test "should destroy areaatuacao" do
    assert_difference('Areaatuacao.count', -1) do
      delete areaatuacao_url(@areaatuacao)
    end

    assert_redirected_to areaatuacaos_url
  end
end

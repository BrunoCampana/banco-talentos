require 'test_helper'

class CertificacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificacao = certificacaos(:one)
  end

  test "should get index" do
    get certificacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_certificacao_url
    assert_response :success
  end

  test "should create certificacao" do
    assert_difference('Certificacao.count') do
      post certificacaos_url, params: { certificacao: {  } }
    end

    assert_redirected_to certificacao_url(Certificacao.last)
  end

  test "should show certificacao" do
    get certificacao_url(@certificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_certificacao_url(@certificacao)
    assert_response :success
  end

  test "should update certificacao" do
    patch certificacao_url(@certificacao), params: { certificacao: {  } }
    assert_redirected_to certificacao_url(@certificacao)
  end

  test "should destroy certificacao" do
    assert_difference('Certificacao.count', -1) do
      delete certificacao_url(@certificacao)
    end

    assert_redirected_to certificacaos_url
  end
end

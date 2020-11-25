require 'test_helper'

class ImportacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @importacao = importacaos(:one)
  end

  test "should get index" do
    get importacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_importacao_url
    assert_response :success
  end

  test "should create importacao" do
    assert_difference('Importacao.count') do
      post importacaos_url, params: { importacao: { arquivo: @importacao.arquivo } }
    end

    assert_redirected_to importacao_url(Importacao.last)
  end

  test "should show importacao" do
    get importacao_url(@importacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_importacao_url(@importacao)
    assert_response :success
  end

  test "should update importacao" do
    patch importacao_url(@importacao), params: { importacao: { arquivo: @importacao.arquivo } }
    assert_redirected_to importacao_url(@importacao)
  end

  test "should destroy importacao" do
    assert_difference('Importacao.count', -1) do
      delete importacao_url(@importacao)
    end

    assert_redirected_to importacaos_url
  end
end

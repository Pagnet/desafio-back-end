require 'test_helper'

class LojasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loja = lojas(:one)
  end

  test "should get index" do
    get lojas_url
    assert_response :success
  end

  test "should get new" do
    get new_loja_url
    assert_response :success
  end

  test "should create loja" do
    assert_difference('Loja.count') do
      post lojas_url, params: { loja: { cartao: @loja.cartao, cpf: @loja.cpf, dt_ocorrencia: @loja.dt_ocorrencia, hora: @loja.hora, nm_loja: @loja.nm_loja, nm_representante: @loja.nm_representante, tp_transacao: @loja.tp_transacao, vl_movimentacao: @loja.vl_movimentacao } }
    end

    assert_redirected_to loja_url(Loja.last)
  end

  test "should show loja" do
    get loja_url(@loja)
    assert_response :success
  end

  test "should get edit" do
    get edit_loja_url(@loja)
    assert_response :success
  end

  test "should update loja" do
    patch loja_url(@loja), params: { loja: { cartao: @loja.cartao, cpf: @loja.cpf, dt_ocorrencia: @loja.dt_ocorrencia, hora: @loja.hora, nm_loja: @loja.nm_loja, nm_representante: @loja.nm_representante, tp_transacao: @loja.tp_transacao, vl_movimentacao: @loja.vl_movimentacao } }
    assert_redirected_to loja_url(@loja)
  end

  test "should destroy loja" do
    assert_difference('Loja.count', -1) do
      delete loja_url(@loja)
    end

    assert_redirected_to lojas_url
  end
end

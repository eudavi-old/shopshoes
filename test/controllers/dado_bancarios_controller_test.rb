require 'test_helper'

class DadoBancariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dado_bancario = dado_bancarios(:one)
  end

  test "should get index" do
    get dado_bancarios_url
    assert_response :success
  end

  test "should get new" do
    get new_dado_bancario_url
    assert_response :success
  end

  test "should create dado_bancario" do
    assert_difference('DadoBancario.count') do
      post dado_bancarios_url, params: { dado_bancario: { conta: @dado_bancario.conta } }
    end

    assert_redirected_to dado_bancario_url(DadoBancario.last)
  end

  test "should show dado_bancario" do
    get dado_bancario_url(@dado_bancario)
    assert_response :success
  end

  test "should get edit" do
    get edit_dado_bancario_url(@dado_bancario)
    assert_response :success
  end

  test "should update dado_bancario" do
    patch dado_bancario_url(@dado_bancario), params: { dado_bancario: { conta: @dado_bancario.conta } }
    assert_redirected_to dado_bancario_url(@dado_bancario)
  end

  test "should destroy dado_bancario" do
    assert_difference('DadoBancario.count', -1) do
      delete dado_bancario_url(@dado_bancario)
    end

    assert_redirected_to dado_bancarios_url
  end
end

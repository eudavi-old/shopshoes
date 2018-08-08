require 'test_helper'

class AgenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agencium = agencia(:one)
  end

  test "should get index" do
    get agencia_url
    assert_response :success
  end

  test "should get new" do
    get new_agencium_url
    assert_response :success
  end

  test "should create agencium" do
    assert_difference('Agencium.count') do
      post agencia_url, params: { agencium: { nome_agencia: @agencium.nome_agencia } }
    end

    assert_redirected_to agencium_url(Agencium.last)
  end

  test "should show agencium" do
    get agencium_url(@agencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_agencium_url(@agencium)
    assert_response :success
  end

  test "should update agencium" do
    patch agencium_url(@agencium), params: { agencium: { nome_agencia: @agencium.nome_agencia } }
    assert_redirected_to agencium_url(@agencium)
  end

  test "should destroy agencium" do
    assert_difference('Agencium.count', -1) do
      delete agencium_url(@agencium)
    end

    assert_redirected_to agencia_url
  end
end

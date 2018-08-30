require 'test_helper'

class TelefonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telefone = telefones(:one)
  end

  test "should get index" do
    get telefones_url
    assert_response :success
  end

  test "should get new" do
    get new_telefone_url
    assert_response :success
  end

  test "should create telefone" do
    assert_difference('Telefone.count') do
      post telefones_url, params: { telefone: { telefone: @telefone.telefone } }
    end

    assert_redirected_to telefone_url(Telefone.last)
  end

  test "should show telefone" do
    get telefone_url(@telefone)
    assert_response :success
  end

  test "should get edit" do
    get edit_telefone_url(@telefone)
    assert_response :success
  end

  test "should update telefone" do
    patch telefone_url(@telefone), params: { telefone: { telefone: @telefone.telefone } }
    assert_redirected_to telefone_url(@telefone)
  end

  test "should destroy telefone" do
    assert_difference('Telefone.count', -1) do
      delete telefone_url(@telefone)
    end

    assert_redirected_to telefones_url
  end
end

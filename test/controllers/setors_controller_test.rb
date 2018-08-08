require 'test_helper'

class SetorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setor = setors(:one)
  end

  test "should get index" do
    get setors_url
    assert_response :success
  end

  test "should get new" do
    get new_setor_url
    assert_response :success
  end

  test "should create setor" do
    assert_difference('Setor.count') do
      post setors_url, params: { setor: { setor: @setor.setor } }
    end

    assert_redirected_to setor_url(Setor.last)
  end

  test "should show setor" do
    get setor_url(@setor)
    assert_response :success
  end

  test "should get edit" do
    get edit_setor_url(@setor)
    assert_response :success
  end

  test "should update setor" do
    patch setor_url(@setor), params: { setor: { setor: @setor.setor } }
    assert_redirected_to setor_url(@setor)
  end

  test "should destroy setor" do
    assert_difference('Setor.count', -1) do
      delete setor_url(@setor)
    end

    assert_redirected_to setors_url
  end
end

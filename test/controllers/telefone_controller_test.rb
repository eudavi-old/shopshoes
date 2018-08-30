require 'test_helper'

class TelefoneControllerTest < ActionDispatch::IntegrationTest
  test "should get telefone" do
    get telefone_telefone_url
    assert_response :success
  end

end

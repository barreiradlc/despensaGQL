require 'test_helper'

class ProvimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provimento = provimentos(:one)
  end

  test "should get index" do
    get provimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_provimento_url
    assert_response :success
  end

  test "should create provimento" do
    assert_difference('Provimento.count') do
      post provimentos_url, params: { provimento: { nome: @provimento.nome } }
    end

    assert_redirected_to provimento_url(Provimento.last)
  end

  test "should show provimento" do
    get provimento_url(@provimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_provimento_url(@provimento)
    assert_response :success
  end

  test "should update provimento" do
    patch provimento_url(@provimento), params: { provimento: { nome: @provimento.nome } }
    assert_redirected_to provimento_url(@provimento)
  end

  test "should destroy provimento" do
    assert_difference('Provimento.count', -1) do
      delete provimento_url(@provimento)
    end

    assert_redirected_to provimentos_url
  end
end

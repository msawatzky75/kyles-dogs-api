require 'test_helper'

class ProductStatusCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_status_code = product_status_codes(:one)
  end

  test "should get index" do
    get product_status_codes_url, as: :json
    assert_response :success
  end

  test "should create product_status_code" do
    assert_difference('ProductStatusCode.count') do
      post product_status_codes_url, params: { product_status_code: { description: @product_status_code.description, name: @product_status_code.name } }, as: :json
    end

    assert_response 201
  end

  test "should show product_status_code" do
    get product_status_code_url(@product_status_code), as: :json
    assert_response :success
  end

  test "should update product_status_code" do
    patch product_status_code_url(@product_status_code), params: { product_status_code: { description: @product_status_code.description, name: @product_status_code.name } }, as: :json
    assert_response 200
  end

  test "should destroy product_status_code" do
    assert_difference('ProductStatusCode.count', -1) do
      delete product_status_code_url(@product_status_code), as: :json
    end

    assert_response 204
  end
end

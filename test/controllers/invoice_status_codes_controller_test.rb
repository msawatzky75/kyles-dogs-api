require 'test_helper'

class InvoiceStatusCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_status_code = invoice_status_codes(:one)
  end

  test "should get index" do
    get invoice_status_codes_url, as: :json
    assert_response :success
  end

  test "should create invoice_status_code" do
    assert_difference('InvoiceStatusCode.count') do
      post invoice_status_codes_url, params: { invoice_status_code: { description: @invoice_status_code.description, name: @invoice_status_code.name } }, as: :json
    end

    assert_response 201
  end

  test "should show invoice_status_code" do
    get invoice_status_code_url(@invoice_status_code), as: :json
    assert_response :success
  end

  test "should update invoice_status_code" do
    patch invoice_status_code_url(@invoice_status_code), params: { invoice_status_code: { description: @invoice_status_code.description, name: @invoice_status_code.name } }, as: :json
    assert_response 200
  end

  test "should destroy invoice_status_code" do
    assert_difference('InvoiceStatusCode.count', -1) do
      delete invoice_status_code_url(@invoice_status_code), as: :json
    end

    assert_response 204
  end
end

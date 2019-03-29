module V1
  class InvoiceStatusCodesController < ApiController
    before_action :set_invoice_status_code, only: [:show, :update, :destroy]

    # GET /invoice_status_codes
    def index
      @invoice_status_codes = InvoiceStatusCode.all

      render json: @invoice_status_codes
    end

    # GET /invoice_status_codes/1
    def show
      render json: @invoice_status_code
    end

    # POST /invoice_status_codes
    def create
      @invoice_status_code = InvoiceStatusCode.new(invoice_status_code_params)

      if @invoice_status_code.save
        render json: @invoice_status_code, status: :created, location: @invoice_status_code
      else
        render json: @invoice_status_code.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /invoice_status_codes/1
    def update
      if @invoice_status_code.update(invoice_status_code_params)
        render json: @invoice_status_code
      else
        render json: @invoice_status_code.errors, status: :unprocessable_entity
      end
    end

    # DELETE /invoice_status_codes/1
    def destroy
      @invoice_status_code.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_status_code
      @invoice_status_code = InvoiceStatusCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_status_code_params
      params.require(:invoice_status_code).permit(:name, :description)
    end
  end
end

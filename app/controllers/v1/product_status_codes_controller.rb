module V1
  class ProductStatusCodesController < ApiController
    before_action :set_product_status_code, only: [:show, :update, :destroy]

    # GET /product_status_codes
    def index
      @product_status_codes = ProductStatusCode.all

      render json: @product_status_codes
    end

    # GET /product_status_codes/1
    def show
      render json: @product_status_code
    end

    # POST /product_status_codes
    def create
      @product_status_code = ProductStatusCode.new(product_status_code_params)

      if @product_status_code.save
        render json: @product_status_code, status: :created, location: @product_status_code
      else
        render json: @product_status_code.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /product_status_codes/1
    def update
      if @product_status_code.update(product_status_code_params)
        render json: @product_status_code
      else
        render json: @product_status_code.errors, status: :unprocessable_entity
      end
    end

    # DELETE /product_status_codes/1
    def destroy
      @product_status_code.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product_status_code
      @product_status_code = ProductStatusCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_status_code_params
      params.require(:product_status_code).permit(:name, :description)
    end
  end
end

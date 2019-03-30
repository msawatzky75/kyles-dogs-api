module V1
  class ProductsController < ApiController
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products
    def index
      # ILIKE - postgres case insensitivity
      # price, price range (including invert), general search, name, description, category, status code
      @products = Product.all # creates an anonymous scope
      @products = @products.where(product_category: params[:product_category]) if params[:product_category].present?
      @products = @products.where(product_status_code: params[:product_status_code]) if params[:product_status_code].present?
      @products = @products.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present?
      @products = @products.where('description ILIKE ?', "%#{params[:description]}%") if params[:description].present?
      @products = @products.where('name ILIKE ? OR description ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      @products = @products.where(price: params[:price]) if params[:price].present?
      @products = @products.where(params[:not_between].present? ? 'price NOT BETWEEN ? AND ?' : 'price BETWEEN ? AND ?', params[:price_low].present? ? params[:price_low] : 0, params[:price_high].present? ? params[:price_high] : 1_000_000_000)

      data = @products.page(params[:page] ? params[:page].to_i : 1)
      render json: { data: data, meta: pagination_meta(data) }
    end

    # GET /products/1
    def show
      render json: @product
    end

    # POST /products
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :product_status_code, :product_category)
    end

    def pagination_meta(object)
      { current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count }
    end
  end
end

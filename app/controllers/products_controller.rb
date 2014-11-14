class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = current_user.products.includes(:unit, :category).order("#{params[:order_by] || 'title'} #{params[:direction] || 'asc'}")
  end

  # POST /products.json
  def create
    @product = current_user.products.create(product_params)
  end

  # PATCH/PUT /products/1.json
  def update
    @product.update(product_params)
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = current_user.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :rest, :required, :unit_id, :category_id)
    end
end

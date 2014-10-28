class ProductsRecipesController < ApplicationController
  before_action :set_recipe
  before_action :set_product, only: [:destroy]
  before_action :set_products_recipe, only: [:destroy]

  # GET /recipes/1/products
  # GET /recipes/1/products.json
  def index
    @products_recipes = current_user.products_recipes.where(recipe_id: @recipe.id)
  end

  # GET /recipes/1/products/new
  def new
    @products_recipe = current_user.products_recipes.new
  end

  # POST /recipes/1/products
  # POST /recipes/1/products.json
  def create
    @products_recipe = current_user.products_recipes.new(products_recipe_params.merge(recipe_id: @recipe.id))

    respond_to do |format|
      if @products_recipe.save
        format.html { redirect_to @recipe, notice: 'Product was successfully added.' }
        format.json { render :show, status: :created, location: @products_recipe }
      else
        format.html { render :new }
        format.json { render json: @products_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1/products/1
  # DELETE /recipes/1/products/1.json
  def destroy
    @products_recipe.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @recipe.products.find(params[:id])
    end

    def set_recipe
      @recipe = current_user.recipes.find(params[:recipe_id])
    end

    def set_products_recipe
      @products_recipe = current_user.products_recipes.where(recipe_id: @recipe.id, product_id: @product.id).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_recipe_params
      params.require(:products_recipe).permit(:product_id, :required, :unit_id)
    end
end

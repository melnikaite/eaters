class ProductsRecipesController < ApplicationController
  before_action :set_recipe
  before_action :set_products_recipe, only: [:destroy, :update]

  # GET /recipes/1/products
  def index
    @products_recipes = current_user.products_recipes.where(recipe_id: @recipe.id)
  end

  # POST /recipes/1/products.json
  def create
    @products_recipe = current_user.products_recipes.create(products_recipe_params.merge(recipe_id: @recipe.id))
  end

  # PATCH/PUT /recipes/1/products/1.json
  def update
    @products_recipe.update(products_recipe_params)
  end

  # DELETE /recipes/1/products/1.json
  def destroy
    @products_recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:recipe_id])
    end

    def set_products_recipe
      @products_recipe = current_user.products_recipes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_recipe_params
      params.require(:products_recipe).permit(:product_id, :required, :unit_id)
    end
end

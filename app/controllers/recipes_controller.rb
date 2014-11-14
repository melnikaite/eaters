class RecipesController < ApplicationController
  before_action :set_recipe, only: [:update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes.order("#{params[:order_by] || 'title'} #{params[:direction] || 'asc'}")
  end

  # POST /recipes.json
  def create
    @recipe = current_user.recipes.create(recipe_params)
  end

  # PATCH/PUT /recipes/1.json
  def update
    @recipe.update(recipe_params)
  end

  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title)
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  # GET /categories
  def index
    @categories = current_user.categories.order("#{params[:order_by] || 'title'} #{params[:direction] || 'asc'}")
  end

  # POST /categories.json
  def create
    @category = current_user.categories.create(category_params)
  end

  # PATCH/PUT /categories/1.json
  def update
    @category.update(category_params)
  end

  # DELETE /categories/1.json
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title)
    end
end

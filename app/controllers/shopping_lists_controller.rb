class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:update, :destroy]

  # GET /shopping_lists
  # GET /shopping_lists.json
  def index
    @shopping_lists = current_user.shopping_lists.order("#{params[:order_by] || 'title'} #{params[:direction] || 'asc'}")
  end

  # POST /shopping_lists.json
  def create
    @shopping_list = current_user.shopping_lists.create(shopping_list_params)
  end

  # PATCH/PUT /shopping_lists/1.json
  def update
    @shopping_list.update(shopping_list_params)
  end

  # DELETE /shopping_lists/1.json
  def destroy
    @shopping_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_params
      params.require(:shopping_list).permit(:title, :rest, :required, :unit_id, :category_id)
    end
end

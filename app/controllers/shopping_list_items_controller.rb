class ShoppingListItemsController < ApplicationController
  before_action :set_shopping_list
  before_action :set_shopping_list_item, only: [:destroy, :update]

  # GET /shopping_lists/1/shopping_list_items
  def index
    @shopping_list_items = @shopping_list.shopping_list_items.where(shopping_list_id: @shopping_list.id)
  end

  # POST /shopping_lists/1/shopping_list_items.json
  def create
    @shopping_list_item = @shopping_list.shopping_list_items.create(shopping_list_params.merge(shopping_list_id: @shopping_list.id))
  end

  # PATCH/PUT /shopping_lists/1/shopping_list_items/1.json
  def update
    @shopping_list_item.update(shopping_list_params)
  end

  # DELETE /shopping_lists/1/shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:shopping_list_id])
    end

    def set_shopping_list_item
      @shopping_list_item = @shopping_list.shopping_list_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_params
      params.require(:shopping_list_item).permit(:product_id, :required, :unit_id, :done)
    end
end

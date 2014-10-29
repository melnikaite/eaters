class ShoppingListItemsController < ApplicationController
  before_action :set_shopping_list
  before_action :set_shopping_list_item, only: [:destroy, :edit]

  # GET /shopping_lists/1/shopping_list_items
  # GET /shopping_lists/1/shopping_list_items.json
  def index
    @shopping_list_items = @shopping_list.shopping_list_items.where(shopping_list_id: @shopping_list.id)
  end

  # GET /shopping_lists/1/shopping_list_items/new
  def new
    @shopping_list_item = @shopping_list.shopping_list_items.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists/1/shopping_list_items
  # POST /shopping_lists/1/shopping_list_items.json
  def create
    @shopping_list_item = @shopping_list.shopping_list_items.new(shopping_list_params.merge(shopping_list_id: @shopping_list.id))

    respond_to do |format|
      if @shopping_list_item.save
        format.html { redirect_to shopping_list_shopping_list_items_path(@shopping_list), notice: 'Product was successfully added.' }
        format.json { render :index, status: :created, location: @shopping_list_item }
      else
        format.html { render :new }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1/shopping_list_items/1
  # PATCH/PUT /shopping_lists/1/shopping_list_items/1.json
  def update
    respond_to do |format|
      if @shopping_list_item.update(product_params)
        format.html { redirect_to @shopping_list_item, notice: 'Product was successfully updated.' }
        format.json { render :index, status: :ok, location: @shopping_list_item }
      else
        format.html { render :edit }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1/shopping_list_items/1
  # DELETE /shopping_lists/1/shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_list_shopping_list_items_path(@shopping_list), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
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

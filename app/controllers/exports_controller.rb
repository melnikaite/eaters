class ExportsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:callback]
  skip_before_filter :verify_authenticity_token, :only => [:callback]
  before_action :set_shopping_list, only: [:index, :create, :destroy]
  before_action :set_integration, only: [:create, :destroy]

  # GET /exports.json
  def index
    @integrations = current_user.integrations.where(provider: @shopping_list.saved_in)
  end

  # POST /exports.json
  def create
    @shopping_list.save_in(@integration)
    redirect_to :back
  end

  # POST /exports/callback.json
  def callback
    if params[:shopping_list_id] && params[:integration_id]
      @shopping_list = ShoppingList.find(params[:shopping_list_id])
      @integration = Integration.find(params[:integration_id])
    end
    @shopping_list.external_update(@integration, params)
    render nothing: true
  end

  # DELETE /exports.json
  def destroy
    @shopping_list.remove_from(@integration)
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:shopping_list_id])
    end

    def set_integration
      @integration = current_user.integrations.find(params[:integration_id])
    end
end

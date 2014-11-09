class ExportsController < ApplicationController
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

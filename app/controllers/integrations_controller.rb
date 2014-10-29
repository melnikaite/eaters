class IntegrationsController < ApplicationController
  before_action :set_integration, only: [:destroy]

  # GET /integrations
  # GET /integrations.json
  def index
    @integrations = current_user.integrations
  end

  # GET /integrations/new
  def new
    @integration = Integration.new
  end

  # POST /integrations
  # POST /integrations.json
  def create
    redirect_to integration_params[:provider]
  end

  # DELETE /integrations/1
  # DELETE /integrations/1.json
  def destroy
    @integration.destroy
    respond_to do |format|
      format.html { redirect_to integrations_url, notice: 'Integration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integration
      @integration = current_user.integrations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def integration_params
      params.require(:integration).permit(:provider)
    end
end

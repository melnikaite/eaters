class TrelloIntegrationController < ApplicationController
  def boards
    @boards = TrelloIntegration.new(current_user).boards
  end

  def lists
    @lists = TrelloIntegration.new(current_user).lists(params[:board_id])
  end

  def create
    current_user.integrations.create!(provider: :trello, details: {list_id: params[:list_id]})
    flash['notice'] = 'Trello list saved!'
    redirect_to root_path
  end
end

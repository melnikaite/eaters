class UsersController < ApplicationController
  # GET /users.json
  def index
    @user = current_user
  end
end

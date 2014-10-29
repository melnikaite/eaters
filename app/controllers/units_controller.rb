class UnitsController < ApplicationController
  # GET /units.json
  def index
    @units = Unit.all
  end
end

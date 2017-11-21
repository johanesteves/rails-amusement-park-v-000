class AttractionsController < ApplicationController
  before_action :admin?, only: [:new, :create]
  before_action :current_user, only: [:index, :show]


  def index
    @attractions  = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create

  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
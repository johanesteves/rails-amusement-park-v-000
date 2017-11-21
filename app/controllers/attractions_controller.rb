class AttractionsController < ApplicationController
  before_action :admin?, only: [:new, :create, :edit, :update]
  before_action :current_user, only: [:index, :show]


  def index
    @attractions  = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'attraction/new'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])

    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction.id)
    else
      render 'attraction/edit'
    end

  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end

class RidesController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @ride  = Ride.new(ride_params)
    message = @ride.take_ride
    
    if message != true
      flash[:alert] = message
    end
    redirect_to user_path(@current_user)
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
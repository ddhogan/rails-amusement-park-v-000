class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @user = current_user
        @ride = Ride.create(ride_params)
        redirect_to user_path(@ride.user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
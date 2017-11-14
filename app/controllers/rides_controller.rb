class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @user = current_user
        @ride = Ride.create(ride_params)
        rejection_reason = @ride.take_ride
        if rejection_reason
            redirect_to user_path(@ride.user), notice: rejection_reason
        else
            redirect_to user_path(@ride.user), notice: "Thanks for riding the #{@attraction.name}"
        end
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
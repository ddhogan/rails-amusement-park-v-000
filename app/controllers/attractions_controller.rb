class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]
    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new
    end

    private
    def set_attraction
        @attraction = Attraction.find(params[:id])
    end
end
class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def show
        if session.include? :user_id
            @user = User.find_by(params[:id])
        else
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end
end
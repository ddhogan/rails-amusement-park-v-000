class SessionsController < ApplicationController
    def new
        @user = User.new
        # @users = User.all
        render 'signin'
    end

    def create
        # @users = User.all
        # binding.pry
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            # binding.pry
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

end
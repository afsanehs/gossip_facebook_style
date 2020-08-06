class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        # binding.pry
        @user = User.new(email: params[:user][:email], password: params[:user][:password])
        @user.save!
        # @user = User.create!(params.require(:user).permit(:username, :password))
        session[:user_id] = @user.id
        redirect_to '/welcome'
    end
end

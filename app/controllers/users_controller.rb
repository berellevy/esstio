class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @open_orders = @user.open_orders
    @top_five_restaurants = Restaurant.top_rated 
  end

  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end 
  
  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :password, :username)
  end
end

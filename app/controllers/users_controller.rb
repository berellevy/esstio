class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @open_orders = @user.open_orders
    @restaurants = Restaurant.all
  end

  def index
    @users = User.all
  end
  

end

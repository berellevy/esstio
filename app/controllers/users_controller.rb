class UsersController < ApplicationController
  skip_before_action :auth_user, only: [:new, :create]
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def show
    @open_orders = @user.open_orders
    @top_five_restaurants = Restaurant.top_rated 
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end 

  def edit

    
  end
  
  def update
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_path(@user)
      end
  end
  
  private

  def find_user
    @user = User.find_by(id: params[:id])
    return redirect_to user_path(session[:user_id]) unless @user == @current_user 
  end
  
  
  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :password, :username)
  end
end

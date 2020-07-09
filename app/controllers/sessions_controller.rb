class SessionsController < ApplicationController
  skip_before_action :auth_user, only: [:login, :create_user, :create_restaurant]

  def login
    return redirect_to user_path(session[:user_id]) if session[:user_id]
  end
  
  def create_user
    user = User.find_by(username: params[:session][:username])
    if !user
      flash[:error] = "User not found"
      redirect_to new_login_path
    elsif user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "Password incorrect"
      redirect_to new_login_path
    end
  end

  def create_restaurant
    restaurant = Restaurant.find_by(username: params[:session][:username])
    if !restaurant
      flash[:error] = "Restaurant not found"
      redirect_to new_login_path
    elsif restaurant.authenticate(params[:session][:password])
      session[:restaurant_id] = restaurant.id
      redirect_to restaurant
    else
      flash[:error] = "Password incorrect"
      redirect_to new_login_path
    end
  end

  def logout
    session.delete(:user_id)
    session.delete(:restaurant_id)
    redirect_to new_login_path
  end

end

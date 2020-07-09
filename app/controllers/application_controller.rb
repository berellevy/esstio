class ApplicationController < ActionController::Base
  before_action :auth_user

  private

  def set_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    elsif session[:restaurant_id]
      @current_restaurant = Restaurant.find_by(id: session[:restaurant_id])
    end
  end
  
  def auth_user
    redirect_to new_login_path unless set_user
  end
  

    
end

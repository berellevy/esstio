class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end
  
  def show
    if session[:user_id]
      @restaurant = Restaurant.find(params[:id])
      @items = @restaurant.items
      @new_order = Order.new(restaurant: @restaurant)
      render 'show_for_user'
    elsif session[:restaurant_id]
      @restaurant = Restaurant.find(session[:restaurant_id])
      @items = @restaurant.items
      @open_orders = @restaurant.open_orders
      render 'show_for_restaurant'
    end
  end

  


end

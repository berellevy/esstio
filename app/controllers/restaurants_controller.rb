class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end
  
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
    @new_order = Order.new(restaurant: @restaurant)
  end

  


end

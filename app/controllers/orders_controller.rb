class OrdersController < ApplicationController
  before_action :find_order, only: [:edit, :update, :show, :destroy]

  def index
    @orders = Order.all
  end
  
  def show
    @restaurant = @order.restaurant
    @user = @order.user
    @items = @order.items
  end
  


  private

  def find_order
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:user, :restaurant, :date, items: [])
  end
  
end

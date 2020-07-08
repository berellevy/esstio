class OrdersController < ApplicationController
  before_action :find_order, only: [:edit, :update, :show, :destroy]

  def index
    @orders = @current_user.orders.all
  end
  
  def show
    @restaurant = @order.restaurant
    @user = @order.user
    @items = @order.items
  end
  
  # def new 
  #     @order = Order.new 
  # end

  def create 
    @order = Order.new(order_params(:restaurant_id, item_ids: []))
    @order.user = @current_user
    
    if @order.save
      redirect_to order_path(@order)
    else 
      flash[:errors] = @order.errors.full_messages
      redirect_to restaurant_path(params[:order][:restaurant_id])
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
  
  def order_params(*args)
    params.require(:order).permit(args)
  end
  
end

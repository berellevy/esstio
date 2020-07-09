class OrdersController < ApplicationController
  before_action :find_order, only: [:edit, :update, :show, :destroy, :change_status]

  def index
    if @current_user
      @orders = @current_user.orders.all
      render 'index_for_user'
    elsif @current_restaurant
      @orders = @current_restaurant.orders.all
      render 'index_for_restaurant'
    end
  end
  
  def show
    if @current_user
      @restaurant = @order.restaurant
      @user = @order.user
      @items = @order.items
      render 'show_for_user'
    elsif @current_restaurant
      @user = @order.user
      @items = @order.items
      render 'show_for_restaurant'
    end
  end
  
  # def new 
  #     @order = Order.new 
  # end

  def change_status
    redirect_to restaurant_path(@current_restaurant) unless @order.restaurant == @current_restaurant
    @order.status =  params[:status_option]
    @order.save
    redirect_to restaurant_path(@current_restaurant)
  end
  

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

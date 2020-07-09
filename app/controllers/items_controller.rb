class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :auth_restaurant
  def index
    @items = @current_restaurant.items
  end

  # def show
  
  # end

  def edit
  
  end
  
  def update
      if @item.update_attributes(item_params)
        redirect_to items_path
      else
        flash[:errors] = @item.errors.full_messages
        redirect_to items_path
      end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.restaurant = @current_restaurant
    if @item.save
      redirect_to items_path
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to new_item_path
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end
  
  
  
  
  

  

  private
  def auth_restaurant
    redirect_to new_login_path unless @current_restaurant
  end
  

  def find_item
    @item = Item.find(params[:id])
    redirect_to new_login_path unless @item.restaurant == @current_restaurant
  end

  def item_params
    params.require(:item).permit(:name, :description, :price)  
  end
  
  
end

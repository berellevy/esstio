class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :show, :destroy]
  # def index
  #   @items = Item.all
  # end

  def show
  
  end

  # def edit
  
  # end
  
  # def update
  #     if @item.update_attributes(item_params)
  #       redirect_to @item
  #     else
  #       render 'edit'
  #     end
  # end


  

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price)  
  end
  
  
end

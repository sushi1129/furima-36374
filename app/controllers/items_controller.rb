class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :info, :category_id, :condition_id, :shipping_cost_id, :prefectures_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end

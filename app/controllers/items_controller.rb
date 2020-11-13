class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :status_id, :delivery_fee_id, :prefectual_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end

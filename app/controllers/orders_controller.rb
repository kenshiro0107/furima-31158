class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
    # @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address)
    # @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_address
    params.require(:order_address).permit(:postal_number, :prefectural_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address[:token],
        currency: 'jpy'
      )
    end

end
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_own
  before_action :redirect_if_soldout
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building,
                                          :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def redirect_if_own
    return if current_user != @item.user

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_soldout
    return unless @item.order.present?

    redirect_to root_path
  end
end

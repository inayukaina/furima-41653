class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_condition_id, :shipping_cost_status_id, :prefecture_id,
                                 :shipping_schedule_id, :price, :image).merge(user_id: current_user.id)
  end
end

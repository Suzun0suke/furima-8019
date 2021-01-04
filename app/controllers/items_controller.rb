class ItemsController < ApplicationController
  before_action :move_to_index , only:[:new]
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
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_cost_id, :shipment_source_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end

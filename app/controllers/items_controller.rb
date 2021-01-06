class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
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
  def show
    @item = Item.find(params[:id])
  end
  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_cost_id, :shipment_source_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end

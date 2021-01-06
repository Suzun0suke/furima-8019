class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, :purchased_item ,only:[:edit]
  

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_cost_id, :shipment_source_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
    redirect_to root_path
    end
  end
  def purchased_item
    unless @item.purchase.blank?
      redirect_to root_path
    end
  end
end

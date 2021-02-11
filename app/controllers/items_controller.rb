class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :move_to_index, :destroy]
  before_action :move_to_index, :purchased_item ,only:[:edit, :destroy]
  
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
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_cost_id, :shipment_source_id, :shipping_day_id, :selling_price, :image, :tag_list).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
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

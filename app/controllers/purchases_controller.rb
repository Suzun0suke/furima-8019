class PurchasesController < ApplicationController
  before_action :authenticate_user!, :item_find, :move_to_index, :purchased_item
  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_delivery).permit(:phone_number, :postal_cord, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  def item_find
    @item = Item.find(params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  #出品したユーザーは購入できない
  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  # 購入された商品の購入ページへはいけない
  def purchased_item
    unless @item.purchase.blank?
      redirect_to root_path
    end
  end
end
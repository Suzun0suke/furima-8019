class LikesController < ApplicationController
  before_action :set_item
  def create
    like = @item.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end

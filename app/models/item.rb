class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_cost
  belongs_to :shipment_source
  belongs_to :shipping_day
  belongs_to :state
  belongs_to :user
  has_many :likes
  has_one :purchase
  acts_as_taggable
  # 空欄禁止
  with_options presence: true do
    validates :category
    validates :delivery_cost
    validates :shipment_source
    validates :shipping_day
    validates :shipping_day
    validates :state
    validates :image
    validates :name
    validates :explanation
  end
  
  # プルリスト１番禁止
  with_options numericality: { other_than: 1 , message:'は --- 以外を選択してください'} do
    validates :category_id 
    validates :delivery_cost_id
    validates :shipment_source_id
    validates :shipping_day_id
    validates :state_id
  end

  validates :selling_price, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999}
  validates :selling_price, numericality: {only_integer: true}

  def self.search(search)
    if search != ""
      name = Item.where('name LIKE(?)', "%#{search}%")
      tag = Item.tagged_with([search], wild: true, any: true)
      name | tag
    end
  end
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end

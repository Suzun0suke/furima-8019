class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
  end

  validates :prefecture_id,numericality: { other_than: 1 }

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_cord: postal_cord, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end
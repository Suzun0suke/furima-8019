require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery,user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe "商品購入" do
    context "購入できる時" do
      it "情報が全て埋まっている" do 
        expect(@purchase_delivery).to be_valid 
      end
      it "建物情報のみない" do
        @purchase_delivery.building = nil
        expect(@purchase_delivery).to be_valid
      end
    end
    context "購入できない時(記入漏れ)" do
      it "user_idがない" do 
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it "item_idがない" do 
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号がない" do 
        @purchase_delivery.postal_cord = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal cord can't be blank")
      end
      it "都道府県がない" do 
        @purchase_delivery.prefecture_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村がない" do 
        @purchase_delivery.municipality = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地などがない" do 
        @purchase_delivery.address = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がない" do 
        @purchase_delivery.phone_number = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it "カードのtoken情報が正しくない" do 
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
    context "購入できない時(その他)" do
      it "郵便番号にハイフンがない" do 
        @purchase_delivery.postal_cord = "1230000"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
      end
      it "電話番号が11桁よりも多い" do 
        @purchase_delivery.phone_number = "090123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid.") 
      end
      it "電話番号にハイフンがある" do
        @purchase_delivery.phone_number = "090-1234-5678"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid.") 
      end
      it "prefecture_idが1" do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture must be other than 1")
      end
    end
    
  end
end

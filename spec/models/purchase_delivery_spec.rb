require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @p_d = FactoryBot.build(:purchase_delivery)
  end
  describe "商品購入" do
    context "購入できる時" do
      it "情報が全て埋まっている" do 
        expect(@p_d).to be_valid 
      end
      it "建物情報のみない" do
        @p_d.building = nil
        expect(@p_d).to be_valid
      end
    end
    context "購入できない時(記入漏れ)" do
      it "user_idがない" do 
        @p_d.user_id = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("User can't be blank")
      end
      it "item_idがない" do 
        @p_d.item_id = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号がない" do 
        @p_d.postal_cord = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Postal cord can't be blank")
      end
      it "都道府県がない" do 
        @p_d.prefecture_id = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村がない" do 
        @p_d.municipality = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地などがない" do 
        @p_d.address = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がない" do 
        @p_d.phone_number = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Phone number can't be blank")
      end
      it "カードのtoken情報が正しくない" do 
        @p_d.token = nil
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Token can't be blank")
      end
    end
    context "購入できない時(その他)" do
      it "郵便番号にハイフンがない" do 
        @p_d.postal_cord = "1230000"
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
      end
      it "電話番号が11桁よりも多い" do 
        @p_d.phone_number = "090123456789"
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Phone number is invalid.") 
      end
      it "電話番号にハイフンがある" do
        @p_d.phone_number = "090-1234-5678"
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Phone number is invalid.") 
      end
      it "prefecture_idが1" do
        @p_d.prefecture_id = "1"
        @p_d.valid?
        expect(@p_d.errors.full_messages).to include("Prefecture must be other than 1")
      end
    end
    
  end
end

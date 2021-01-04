require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品の保存" do
    before do
      @item = FactoryBot.build(:item)
    end
    context "商品の保存ができる場合" do
      it "必要な情報が充足している" do
        expect(@item).to be_valid
      end
    end
    context "情報が欠損しており、登録できない場合" do
      it "画像がない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明がない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリー情報がない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品状態がない" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "配送料負担がない" do
        @item.delivery_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end
      it "発送もとの情報がない" do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it "発送までの日数がない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "価格の情報がない" do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      
    end
    context "各種activeHashのidが１の場合" do
      it "カテゴリー情報" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品状態" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "配送料負担" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end
      it "発送もと" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it "発送までの日数がない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
    end
    
    context "その他validatesに引っかかるもの" do
      it "価格が300未満" do
        @item.selling_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
      it "価格が10,000,000以上" do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
      it "価格が半角数字以外" do
        @item.selling_price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it "価格が半角英数混合" do
        @item.selling_price = "abc100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it "半角英語だけでは登録できないこと" do
        @item.selling_price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
    end
  end
end


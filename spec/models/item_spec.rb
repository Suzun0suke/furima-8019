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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名がない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "説明がない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリー情報がない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "商品状態がない" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "配送料負担がない" do
        @item.delivery_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送料の負担を入力してください")
      end
      it "発送もとの情報がない" do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "発送までの日数がない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "価格の情報がない" do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
    end
    context "各種activeHashのidが１の場合" do
      it "カテゴリー情報" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは --- 以外を選択してください")
      end
      it "商品状態" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は --- 以外を選択してください")
      end
      it "配送料負担" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送料の負担は --- 以外を選択してください")
      end
      it "発送もと" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は --- 以外を選択してください")
      end
      it "発送までの日数がない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は --- 以外を選択してください")
      end
    end
    
    context "その他validatesに引っかかるもの" do
      it "価格が300未満" do
        @item.selling_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it "価格が10,000,000以上" do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it "価格が半角数字以外" do
        @item.selling_price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "価格が半角英数混合" do
        @item.selling_price = "abc100"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "価格が半角英語" do
        @item.selling_price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end


require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
  describe "新規登録" do
    context "新規登録がうまくいく時" do
      it "ニックネーム、email、password、本人確認情報が全て埋まっている" do
        expect(@user).to be_valid 
      end
    end
    context "新規登録が情報が埋まってなくて登録できない" do
      it "ニックネームが空" do
      end
      it "メールアドレスが空" do
      end
      it "パスワードが空" do
      end
      it "苗字が空" do
      end
      it "名前が空" do
      end
      it "ミョウジが空" do
      end
      it "ナマエが空" do
      end
      it "誕生日が空" do
      end
    end
    context "別途設定したvalidatesで登録できない場合" do
      it "同じemailでの登録" do
        
      end
      it "emailに@がない" do
        
      end
      it "passwordが6文字以下" do
        
      end
      it "passwordに半角数字が混ざっていない" do
        
      end
      it "苗字が全角でない" do
        
      end
      it "名前が全角でない" do
        
      end
      it "ミョウジが全角カナでない" do
        
      end
      it "ナマエが全角カナでない" do
        
      end
    end
    
    
    
  end
end

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
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "メールアドレスが空" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "パスワードが空" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it "苗字が空" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      it "名前が空" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it "ミョウジが空" do
        @user.last_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name f can't be blank") 
      end
      it "ナマエが空" do
        @user.first_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name f can't be blank") 
      end
      it "誕生日が空" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end
    end
    context "別途設定したvalidatesで登録できない場合" do
      it "同じemailでの登録" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが6文字以下" do
        @user.password = "abc1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに半角数字が混ざっていない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "苗字が全角でない" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名前が全角でない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ミョウジが全角カナでない" do
        @user.last_name_f = "ﾐｮｳｼﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name f is invalid")
      end
      it "ナマエが全角カナでない" do
        @user.first_name_f = "ﾅﾏｴ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name f is invalid")
      end
    end
  end
end

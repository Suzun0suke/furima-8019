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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください") 
      end
      it "メールアドレスが空" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください") 
      end
      it "パスワードが空" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください") 
      end
      it "苗字が空" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください") 
      end
      it "名前が空" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください") 
      end
      it "ミョウジが空" do
        @user.last_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください") 
      end
      it "ナマエが空" do
        @user.first_name_f = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエを入力してください") 
      end
      it "誕生日が空" do
        @user.birthday = ""
        @user.valid?

        expect(@user.errors.full_messages).to include("生年月日を入力してください") 
      end
    end
    context "別途設定したvalidatesで登録できない場合" do
      it "同じemailでの登録" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@がない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが6文字以下" do
        @user.password = "abc1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordに半角数字が混ざっていない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "苗字が全角でない" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it "名前が全角でない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "ミョウジが全角カナでない" do
        @user.last_name_f = "ﾐｮｳｼﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です")
      end
      it "ナマエが全角カナでない" do
        @user.first_name_f = "ﾅﾏｴ"
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエは不正な値です")
      end
    end
  end
end

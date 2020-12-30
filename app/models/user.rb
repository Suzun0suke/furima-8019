class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_f
    validates :first_name_f
    validates :birthday
  end

  # 全角（漢字・ひらがな・カタカナ）
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :last_name
    validates :first_name
  end
  # 全角（カタカナ）
  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_f
    validates :first_name_f
  end


end

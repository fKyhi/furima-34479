class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics.' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :user_birth_date
  end
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX }
end

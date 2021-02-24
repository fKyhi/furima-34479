class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics.' }
    validates :first_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics.' }
    validates :user_birth_date
  end
    VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGIX }
end

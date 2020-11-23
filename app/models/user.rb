class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true
  validates :first_name, presence: true
  VALID_PASSWORD_REGEX = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates :last_kana, presence: true, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates :first_kana, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true
end



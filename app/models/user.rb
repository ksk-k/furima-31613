class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    VALID_PASSWORD_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    validates :last_name, format: { with: VALID_PASSWORD_REGEX }
    VALID_PASSWORD_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    validates :first_name, format: { with: VALID_PASSWORD_REGEX }
    VALID_PASSWORD_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
    validates :last_kana, format: { with: VALID_PASSWORD_REGEX }
    VALID_PASSWORD_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
    validates :first_kana, format: { with: VALID_PASSWORD_REGEX }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end



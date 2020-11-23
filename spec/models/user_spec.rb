require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "y", email:"", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"", first_kana:"タロウ", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_kanaが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"", birthday:"2000-1-1")
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

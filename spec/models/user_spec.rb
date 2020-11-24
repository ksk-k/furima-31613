require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "nickname,password,password_confirmation,last_name,first_name,last_kana,first_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手く行かないとき' do
      it "nicknameが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_kanaが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "first_kanaが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "birthdayが空だと登録できない" do
        @user = FactoryBot.build(:user)
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

  describe"その他条件" do
    it "他に同一のemailがあると登録できない" do
      user = User.new(nickname: "y", email:"aaa@gmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      user.save
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに'@'を含んでいないと登録できない"do
      user = User.new(nickname: "y", email:"aaagmail.com", password:"k00000", password_confirmation:"k00000", last_name:"山田", first_name:"太郎", last_kana:"ヤマダ", first_kana:"タロウ", birthday:"2000-1-1")
      @user.valid?
    end
    it "passwordが6文字以上でないと登録できない"do
      @user.password = "k0000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字で構成されていないと登録できない"do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが2回打ち込まれていないと登録できない"do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password打ち込まれた2回が一致していないと登録できない"do
      @user.password_confirmation = "a00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザーの名字が全角のひらがな、カタカナ、漢字でないと登録できない"do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")  
    end
    it "ユーザーの名前が全角のひらがな、カタカナ、漢字でないと登録できない"do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")  
    end
    it "ユーザーの名字の振り仮名が全角のカタカナでないと登録できない"do
      @user.last_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")  
    end
    it "ユーザーの名前の振り仮名が全角のカタカナでないと登録できない"do
      @user.first_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")  
    end
  end
end

require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe "商品購入" do
    context "商品購入がうまくいくとき" do
      it "token,postal_code,prefecture_id,municipality,address,phone_number,user_id,item_idが存在していれば購入できる" do
        expect(@order_form).to be_valid
      end
    end

    context "商品購入がうまくいかないとき" do
      it "postal_codeが空だと購入できない" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecture_idが1だと購入できない" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "municipalityが空だと購入できない" do
        @order_form.municipality = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと購入できない" do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "tokenが空だと購入できない" do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと購入できない" do
        @order_form.user_id = nil
        @order_form.valid?
      end
      it "item_idが空だと購入できない" do
        @order_form.item_id = nil
        @order_form.valid?
      end
    end

    context "商品購入がうまくいかないとき(その他)" do
      it "郵便番号にはハイフンがないと購入できない" do
        @order_form.postal_code = "1111111"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号にはハイフンがあると購入できない" do
        @order_form.phone_number = "12-345-6789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は12桁以上だと購入できない" do
        @order_form.phone_number = 111111111111
        @order_form.valid?
      end
    end
  end
end
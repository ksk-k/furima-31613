require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    context '商品出品がうまくいくとき' do
      it "image,name,detail,category_id,condition_id,delivery_fee_id,prefecture_id,shipping_date_id,price,が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品が上手く行かないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailが空だと登録できない" do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "delivery_fee_idが1だと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipping_date_idが1だと登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
    describe"その他条件" do
      it "価格の範囲が、¥299円以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "価格の範囲が、¥10,000,000円以上だと出品できない"do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "販売価格は半角数字のみ保存可能であること"do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
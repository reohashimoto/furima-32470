require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '出品機能' do
  context "出品できる場合" do
    it "全ての情報が正しく入力されていれば出品できる" do
      expect(@item).to be_valid
    end

  end
  context "出品できない場合" do
    it "商品画像がない場合出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end 

    it "商品名がないと出品できない" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "商品の説明がないと出品できない" do
      @item.item_explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item explanation can't be blank")
    end

    it "カテゴリーの情報がないと出品できない" do
      @item.item_category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank")
    end

    it "カテゴリーの情報がないと出品できない" do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank")
    end

    it "商品の状態についての情報がないと出品できない" do
      @item.product_condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end

    it "商品の状態についての情報がないと出品できない" do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end

    it "配送料の負担についての情報がないと出品できない" do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it "配送料の負担についての情報がないと出品できない" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it "発送元の地域についての情報がないと出品できないこと" do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it "発送元の地域についての情報がないと出品できないこと" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "発送までの日数についての情報がないと出品できない" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it "発送までの日数についての情報がないと出品できない"
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it "価格がないと出品できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price price can't be blank")
    end
    it "価格が300以下であると出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price price can't be blank")
    end
      it "価格が10000000以上であると出品できない" do
        item.price = 10000000
        item.valid?
        expect(@item.errors.full_messages).to include("Price price can't be blank")
      end
    end
  end
end
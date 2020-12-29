require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'カード情報と住所の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    context '商品購入ができる時' do
    it "全ての情報が正しく入力されていれば出品できる" do
      expect(@purchase_address).to be_valid
    end
    it '建物名が空でも購入できること' do
      @purchase_address.building_name = nil
      @purchase_address.valid?
      expect(@purchase_address).to be_valid
    end
    end
    context '商品購入ができない時' do
    it 'postal_codeが空だと登録できない' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
  

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県が空だと登録できない' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "都道府県の値が１だと登録できない"
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では登録できない' do
      @purchase_address.municipality = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空だと登録では登録できない' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空だと登録できない' do
      @purchase_address.telephone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid.")
    end

    it '電話番号が１１文字いないであること' do
      @purchase_address.telephone_number = "111111111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid.")
    end
    it 'ハイフンが入力されている場合は購入できないこと' do
      @purchase_address.telephone_number = "080-1234-5678"
      @purchase_address.valid?
      expect(@purchase_address.to.errors.full_messages).to include("Telephone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと登録できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと登録できない' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
    
require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'カード情報と住所の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it "全ての情報が正しく入力されていれば出品できる" do
      expect(@purchase_address).to be_valid
    end

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
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid. Include hyphen(-)")
    end

    it '電話番号が１１文字いないであること' do
      @purchase_address.telephone_number = 111111111111
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
    end

    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end
    
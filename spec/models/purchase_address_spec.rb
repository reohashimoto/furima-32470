require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_donation = FactoryBot.build(:user_donation)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address.).to be_vaild
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
      @purchase_address.prefecture = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では登録できない' do
      @purchase_address.municipality = nil
      @purchase_address.municipality?
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
      expect(@purchase_address.full_messages).to include("Telephone can't be blank")
    end

    it '電話番号が１１文字いないであること' do
      @purchase_address.telephone_number = 111111111111
      @purchase_address.valid?
      expect(@purchase_address.full_messages).to include("Telephone number is invalid")
    end
  end
end
    
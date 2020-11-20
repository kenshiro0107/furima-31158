require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'postal_numberが空だと保存できないこと' do
      @order_address.postal_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
    end
    it 'postal_numberが半角数字かつ-がないと保存できないこと' do
      @order_address.postal_number = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal number is invalid")
    end
    it 'prefectural_idが空だと保存できないこと' do
      @order_address.prefectural_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectural can't be blank")
    end
    it 'prefectural_idが１だと保存できないこと' do
      @order_address.prefectural_id = '１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectural is not a number")
    end
    it 'municipalityが空だと保存できないこと' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが半角数字でないと保存できないこと' do
      @order_address.phone_number = '１２３４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end

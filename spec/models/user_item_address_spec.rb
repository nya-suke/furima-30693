require 'rails_helper'

RSpec.describe UserItemAddress, type: :model do
  before do
    user =  FactoryBot.create(:user)
    item =  FactoryBot.create(:item)
    @user_item_address = FactoryBot.build(:user_item_address,user_id: user.id, item_id: item.id)
    sleep(0.1)
  end
  describe '商品購入' do
    context '内容に問題がない場合' do
    it 'postal_codeとprefecture_idとcityとaddressesとphone_numberとtokenが存在すれば登録できること' do
      expect(@user_item_address).to be_valid
    end

    it 'building_nameが空でも登録できること' do
      @user_item_address.building_name = ''
      expect(@user_item_address).to be_valid
    end
  end
    context '内容に問題がある場合' do
    it 'postal_codeが空では登録できないこと' do
      @user_item_address.postal_code = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Postal code can't be blank"
    end

    it 'postal_codeが全角では登録できないこと' do
      @user_item_address.postal_code = '１１１−１１１１'
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
    end

    it 'postal_codeがハイフンなしでは登録できないこと' do
      @user_item_address.postal_code = '1111111'
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
    end

    it 'prefecture_idが空では登録できないこと' do
      @user_item_address.prefecture_id = 1
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Prefecture can't be blank"
    end

    it 'cityが空では登録できないこと' do
      @user_item_address.city = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "City can't be blank"
    end

    it 'addressesが空では登録できないこと' do
      @user_item_address.addresses = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Addresses can't be blank"
    end



    it 'phone_numberが空では登録できないこと' do
      @user_item_address.phone_number = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Phone number can't be blank"
    end

    it 'phone_numberがハイフンが入っていたら登録できないこと' do
      @user_item_address.phone_number = '090-1111-1111'
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Phone number is invalid. Input only number"
    end

    it 'phone_numberが9桁以下なら登録できないこと' do
      @user_item_address.phone_number = '090111111'
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Phone number is too short"
    end

    it 'phone_numberが12桁以上であれば登録できないこと' do
      @user_item_address.phone_number = "0" * 12
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Phone number is too short"
    end

    it 'user_idが空では登録できないこと' do
      @user_item_address.user_id = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "User can't be blank"
    end

    it 'item_idが空では登録できないこと' do
      @user_item_address.item_id = ''
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Item can't be blank"
    end

    it 'tokenが空では登録できないこと' do
      @user_item_address.token = nil
      @user_item_address.valid?
      expect(@user_item_address.errors.full_messages).to include "Token can't be blank"
    end


  end
  end
end





 


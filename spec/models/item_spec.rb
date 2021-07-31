require 'rails_helper'

RSpec.describe User, type: :model do
  let(:item) { FactoryBot.create(:item) }
  before do
    @item = FactoryBot.build(:item)
  end

   describe '商品出品' do
      context '内容に問題ない場合' do
        it '必要な情報が適切に入力されていれば登録できる' do
          expect(@item).to be_valid
          
        end
      end
      context '内容に問題がある場合' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end   
        it 'informationが空では登録できない' do
          @item.information = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Information can't be blank")
        end
        it 'category_idが空では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")    
        end
        it 'status_idが空では登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")  
        end
        it 'shipping_fee_idが空では登録できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")  
        end
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
        end
        it 'scheduled_delivery_idが空では登録できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank") 
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥299以下では登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end 
        it 'priceが¥10000000以上では登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceが半角英数混合では登録できない' do
          @item.price = '1000abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが半角英語だけでは登録できない' do
          @item.price = 'aaaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceが全角では登録できない' do
          @item.price = '１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it 'userが紐づいていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
   end
end
  
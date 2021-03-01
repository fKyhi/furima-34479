require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品できるとき' do
      it 'image、name、explain、category_id、state_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上9999999円以下であれば出品できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと出品できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explainが空だと出品できない' do
        @item.explain = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it 'category_idが「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'state_idが「---」だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'State must be other than 1'
      end
      it 'shipping_fee_status_idが---だと出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee status must be other than 1'
      end
      it 'prefecture_idが「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'scheduled_delivery_idが「---」だと出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery must be other than 1'
      end
      it 'priceが空だと出品できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円より安いと出品できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9999999円より高いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが全角文字だと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英数混合だと出品できない' do
        @item.price = '100aa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end

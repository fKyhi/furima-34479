require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入できたとき' do
      it 'post_code、prefecture_id、city、addressed、building、phone_number、token、user_id、item_idが存在すれば購入できる' do
        expect(@purchase_order).to be_valid
      end
      it 'buildingが存在しなくても購入できる' do
        @purchase_order.building = ' '
        expect(@purchase_order).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @purchase_order.post_code = ' '
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank",
                                                                'Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeに[-]が存在しないとき購入できない' do
        @purchase_order.post_code = '1111111'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1のとき購入できない' do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが存在しないとき購入できない' do
        @purchase_order.city = ' '
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressedが存在しないとき購入できない' do
        @purchase_order.addressed = ' '
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Addressed can't be blank")
      end
      it 'phone_numberが存在しないとき購入できない' do
        @purchase_order.phone_number = ' '
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが存在しないとき購入できない' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが存在しないとき購入できない' do
        @purchase_order.user_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないとき購入できない' do
        @purchase_order.item_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

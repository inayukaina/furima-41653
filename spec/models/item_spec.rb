require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '出品情報を登録できるとき' do
      it '全て入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品情報を登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it 'shipping_cost_status_idが空では登録できない' do
        @item.shipping_cost_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost status can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shipping_schedule_idが空では登録できない' do
        @item.shipping_schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping schedule can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが2桁以下では登録できない' do
        @item.price = '99'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too short (minimum is 3 characters)')
      end
      it 'priceが8桁以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too long (maximum is 7 characters)')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字を使用してください')
      end
    end
  end
end

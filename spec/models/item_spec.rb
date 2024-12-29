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
        expect(@item.errors.full_messages).to include '商品画像を入力してください'
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明を入力してください'
      end
      it 'category_idが「---」が選択されている場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it 'item_condition_idが「---」が選択されている場合は登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it 'shipping_cost_status_idが「---」が選択されている場合は登録できない' do
        @item.shipping_cost_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を入力してください'
      end
      it 'prefecture_idが「---」が選択されている場合は登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を入力してください'
      end
      it 'shipping_schedule_idが「---」が選択されている場合は登録できない' do
        @item.shipping_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '価格を入力してください'
      end
      it 'priceが300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが10,000,000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end

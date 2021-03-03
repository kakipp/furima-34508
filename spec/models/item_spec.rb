require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '登録できる場合' do
        it '全ての値が存在すれば登録できること' do
          expect(@item).to be_valid
        end
        it 'priceが300以上9999999以下なら登録できる' do
          @item.price = 300
          expect(@item).to be_valid
        end
      end
      context '登録できない場合' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空では登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'delivery_idが1だと登録できない' do
          @item.delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery must be other than 1")
        end
        it 'delivery_days_idが1だと登録できない' do
          @item.delivery_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
        end
        it 'area_idが1だと登録できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it 'status_idが1だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it 'category_idが1だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'priceが空だと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが300以下だと登録できない' do
          @item.price = 250
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが9999999以上だと登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが半角英数字混合では出品できない' do
          @item.price = 'abc10000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが半角英のみでは出品できない' do
          @item.price = 'abcdef'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが全角文字では出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end

  end
end

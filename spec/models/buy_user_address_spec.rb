require 'rails_helper'

RSpec.describe BuyUserAddress, type: :model do
  describe '#create' do
    before do
      @buy_user_address = FactoryBot.build(:buy_user_address)
    end

    describe '商品購入機能' do
      context '購入できる場合' do
        it '全ての値が存在すれば購入できること' do
          expect(@buy_user_address).to be_valid
        end
        it 'ship_to_addressが空でも購入できる' do
          @buy_user_address.ship_to_address = ""
          expect(@buy_user_address).to be_valid
        end
      end
      context '購入できない場合' do
        it 'address_numberが空の場合' do
          @buy_user_address.address_number = ""
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Address number can't be blank", "Address number is invalid")
        end
        it 'address_numberにハイフンが入ってない場合' do
          @buy_user_address.address_number = "2220001"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Address number is invalid")
        end
        it 'address_numberのハイフンの前が３桁以外の場合' do
          @buy_user_address.address_number = "22-0001"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Address number is invalid")
        end
        it 'address_numberのハイフンの後が４桁以外の場合' do
          @buy_user_address.address_number = "222-000"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Address number is invalid")
        end
        it 'address_numberが全角数字の場合' do
          @buy_user_address.address_number = "２２２-０００１"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Address number is invalid")
        end
        it 'area_idが1の場合' do
          @buy_user_address.area_id = 1
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Area must be other than 1")
        end
        it 'ship_cityが空の場合' do
          @buy_user_address.ship_city = ""
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Ship city can't be blank")
        end
        it 'ship_addressが空の場合' do
          @buy_user_address.ship_address = ""
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Ship address can't be blank")
        end
        it 'telephoneが空の場合' do
          @buy_user_address.telephone = ""
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Telephone can't be blank")
        end
        it 'telephoneが0から始まらない場合' do
          @buy_user_address.telephone = "99912341234"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Telephone is invalid")
        end
        it 'telephoneが11桁以外の場合' do
          @buy_user_address.telephone = "0901234123"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Telephone is invalid")
        end
        it 'telephoneが全角数字の場合' do
          @buy_user_address.telephone = "０９０１２３４１２３４"
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Telephone is invalid")
        end
        it "tokenが空の場合" do
          @buy_user_address.token = nil
          @buy_user_address.valid?
          expect(@buy_user_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end

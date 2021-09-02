require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合'do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合'do
      it 'postal_cadeが空だと保存できない' do
        @order_address.postal_cade = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cade can't be blank")
      end

      it 'postal_cadeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_cade = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cade is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecturesを選択していないと保存できない' do
        @order_address.prefectures_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが空だと保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが半角数字以外だと保存できない' do
        @order_address.telephone_number = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only half-width number")
      end

      it 'telephone_numberが9文字以下だと保存できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short")
      end

      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では保存できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

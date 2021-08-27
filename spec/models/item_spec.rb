require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品登録' do
    context '新規出品登録できる場合' do
      it "item_nameとinfo、image、category_id、condition_id、sipping_cost_id、prefectures_id、sipping_day_id、priceが存在すれば出品登録ができる" do
        expect(@item).to be_valid
      end
    end

    context '新規出品登録できない場合' do
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "infoが空では登録できない" do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "condition_idが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "sipping_cost_idが空では登録できない" do
        @item.sipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping cost can't be blank")
      end

      it "prefectures_idが空では登録できない" do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it "sipping_day_idが空では登録できない" do
        @item.sipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping day can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "userが紐付いていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "priceが299以下の場合登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it "priceが10,000,000以上の場合登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it "priceに文字列が入っている場合登録できない" do
        @item.price = '300en'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが全角数字の場合登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range", "Price is not a number")
      end
    end
  end
end

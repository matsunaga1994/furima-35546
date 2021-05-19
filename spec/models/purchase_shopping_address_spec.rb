require 'rails_helper'

RSpec.describe PurchaseShoppingAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shopping_address = FactoryBot.build(:purchase_shopping_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題がない場合' do
      it "全ての情報が正しく入力されている場合保存できること" do
        expect(@purchase_shopping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では保存できないこと" do
        @purchase_shopping_address.token = nil
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では保存できないこと" do
        @purchase_shopping_address.postal_code = ""
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角のハイフンを含んだ正しい形でなければ保存できないこと" do
        @purchase_shopping_address.postal_code = "1234567"
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "prefecture_idが空では保存できないこと" do
        @purchase_shopping_address.prefecture_id = ""
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では保存できないこと" do
        @purchase_shopping_address.city = ""
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では保存できないこと" do
        @purchase_shopping_address.address = ""
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Address can't be blank")
      end

      it "building_nameが空でも保存できること" do
        @purchase_shopping_address.building_name = ""
        expect(@purchase_shopping_address).to be_valid
      end

      it "phone_numberが空だと登録できないこと" do
        @purchase_shopping_address.phone_number = ""
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが半角数字以外だと登録できないこと" do
        @purchase_shopping_address.phone_number = "０９０１２３４５６７８"
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it "phone_numberが９文字以下だと登録できないこと" do
        @purchase_shopping_address.phone_number = "090123456"
        @purchase_shopping_address.valid?
        expect(@purchase_shopping_address.errors.full_messages).to include("Phone number is too short")
      end
    end
  end
end
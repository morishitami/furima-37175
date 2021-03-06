require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'line2は空でも保存できること' do
        @buyer_address.line2 = ""
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できないこと' do
        @buyer_address.postal_code = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank") 
      end
      it '都道府県が空では保存できないこと' do
        @buyer_address.state_id = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("State can't be blank") 
      end
      it '市町村が空では保存できないこと' do
        @buyer_address.city = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank") 
      end
      it '番地が空では保存できないこと' do
        @buyer_address.line1 = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Line1 can't be blank") 
      end
      it '電話番号が空では保存できないこと' do
        @buyer_address.phone = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone can't be blank") 
      end
      it '郵便番号が3桁ハイフン4桁でなければ保存できないこと' do
        @buyer_address.postal_code = "1234567"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)") 
      end
      it '都道府県のidが1が選択されている場合では保存できないこと' do
        @buyer_address.state_id = "1"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("State can't be blank") 
      end
      it '電話番号が10桁未満の半角数値では保存できないこと' do
        @buyer_address.phone = "123456789"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone is invalid") 
      end
      it '電話番号が11桁を超えるの半角数値では保存できないこと' do
        @buyer_address.phone = "123456789012"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone is invalid") 
      end
      it '電話番号に半角数値以外が含まれている場合は保存できないこと' do
        @buyer_address.phone = "123456789あ"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone is invalid") 
      end
      it "userが紐付いていないと登録できない" do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていないと登録できない" do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank") 
      end
    end
  end
end
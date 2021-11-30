require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    end
  end

  context '内容に問題がない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'line2は空でも保存できること' do
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空では保存できないこと' do
    end
    it '都道府県が空では保存できないこと' do
    end
    it '市町村が空では保存できないこと' do
    end
    it '番地が空では保存できないこと' do
    end
    it '電話番号が空では保存できないこと' do
    end
    it '郵便番号が3桁ハイフン4桁でなければ保存できないこと' do
    end
    it '電話番号が10桁以上11桁以内の半角数値でなければ保存できないこと' do
    end
  end
end
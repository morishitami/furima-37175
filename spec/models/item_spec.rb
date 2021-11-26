require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品新規登録' do
    context '商品出品ができる場合' do
      it "title,explanation,category_id,status_id,postage_id,state_id,day_id,price,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it "titleが空では登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "postage_idが空では登録できない" do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "state_idが空では登録できない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "day_idが空では登録できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "postage_idが1では登録できない" do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "state_idが1では登録できない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "day_idが1では登録できない" do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceが300未満では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが9999999超では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが全角数字では登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "priceが半角文字(英字・ｶﾅ)では登録できない" do
        @item.price = "abcｶﾅ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "priceが全角文字（漢字・ひらがな・カタカナ・英字）では登録できない" do
        @item.price = "漢字ひらカタＡＢ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "userが紐付いていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

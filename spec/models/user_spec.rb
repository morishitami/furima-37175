require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname,email,password,password_confirmation,lastname,firstname,lastname_kana,firstname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "lastname_kanaが空では登録できない" do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "firstname_kanaが空では登録できない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "同一emailが既に登録されている場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が含まれていない場合は登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "aaaaa1"
        @user.password_confirmation = "bbbbb1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "1234a"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに英字が含まれていない場合は登録できない" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "passwordに数字が含まれていない場合は登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "passwordにひらがなが含まれている場合は登録できない" do
        @user.password = "12345aあ"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "passwordにカタカナが含まれている場合は登録できない" do
        @user.password = "12345aア"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "passwordに漢字が含まれている場合は登録できない" do
        @user.password = "12345a漢字"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "lastnameが英字の場合は登録できない" do
        @user.lastname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname  Input full-width characters")
      end
      it "lastnameが数字の場合は登録できない" do
        @user.lastname = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname  Input full-width characters")
      end
      it "firstnameが英字の場合は登録できない" do
        @user.firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname  Input full-width characters")
      end
      it "firstnameが数字の場合は登録できない" do
        @user.firstname = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname  Input full-width characters")
      end
      it "lastname_kanaが英字の場合は登録できない" do
        @user.lastname_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana  Input full-width katakana characters")
      end
      it "lastname_kanaが数字の場合は登録できない" do
        @user.lastname_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana  Input full-width katakana characters")
      end
      it "lastname_kanaが漢字の場合は登録できない" do
        @user.lastname_kana = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana  Input full-width katakana characters")
      end
      it "lastname_kanaがひらがなの場合は登録できない" do
        @user.lastname_kana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana  Input full-width katakana characters")
      end
      it "firstname_kanaが英字の場合は登録できない" do
        @user.firstname_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana  Input full-width katakana characters")
      end
      it "firstname_kanaが数字の場合は登録できない" do
        @user.firstname_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana  Input full-width katakana characters")
      end
      it "firstname_kanaが漢字の場合は登録できない" do
        @user.firstname_kana = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana  Input full-width katakana characters")
      end
      it "firstname_kanaがひらがなの場合は登録できない" do
        @user.firstname_kana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana  Input full-width katakana characters")
      end
    end
  end
end

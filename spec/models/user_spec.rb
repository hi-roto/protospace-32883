require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "すべての項目に入力がある場合は登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが6文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it "profileが空では登録できない" do
        @user.profile = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Profile can't be blank"
      end
      it "occupationが空では登録できない" do
        @user.occupation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Occupation can't be blank"
      end
      it "positionが空では登録できない" do
        @user.position = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Position can't be blank"
      end
    end  
  end
end

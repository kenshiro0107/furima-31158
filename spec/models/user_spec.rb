require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    context '新規登録がうまくいくとき' do
      it "nick_nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "nick_nameが6文字以下で登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
      @user.password = "a1a1a1"
      @user.password_confirmation = "a1a1a1"
      expect(@user).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "nicknameが7文字以上であれば登録できない" do
        @user.nick_name = "a1a1a1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name is too long (maximum is 6 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
         another_user = FactoryBot.create(:user,email:"test@test")
         another2_user = FactoryBot.build(:user,email:"test@test")
        #  another_user.email = @user.email
         another2_user.valid?
         expect(another2_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        # @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end

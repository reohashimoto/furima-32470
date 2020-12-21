require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全て情報が正しく入力されていれば登録できる" do
    expect(@user).to be_valid
    end
  
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
      it "メールアドレスに@が含まれてない場合登録できない" do
        @user.email = "ohaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが半角英字のみの場合登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end
    it "パスワードが半角数字のみの場合登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end

    it "パスワードが全角英数字の場合登録できない" do
      @user.password = "A１A１A１"
      @user.password_confirmation = "A１A１A１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end
      
    it "passwordが6文字以上のでないと登録できないこと" do
      @user.password = "a0a0a"
      @user.password_confirmation = "a0a0a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードと確認用のパスワードが一致しないと登録できない" do
      @user.password = "1a3a56"
      @user.password_confirmation = "1a3a567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "姓が空の場合登録できない" do
      @user.name_kanji_sei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji sei can't be blank")
    end

    it "名が空の場合登録できない" do
      @user.name_kanji_mei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji mei can't be blank")
    end
    it "姓（フリガナ）が空の場合登録できない" do
      @user.name_kana_sei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana sei can't be blank")
    end

    it "名（フリガナ）が空の場合登録できない" do
      @user.name_kana_mei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana mei can't be blank")
    end
    it "姓が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.name_kanji_sei = "a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji sei is invalid. Input full-width characters.")
    end

    it "名が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.name_kanji_mei = "a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji mei is invalid. Input full-width characters.")
    end

    it "姓のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.name_kana_sei = "a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana sei is invalid. Input full-width katakana characters.")
    end

    it "名のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.name_kana_mei = "a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana mei is invalid. Input full-width katakana characters.")
    end
  

    it "birthdayが空では登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
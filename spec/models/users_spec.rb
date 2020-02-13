require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe 'バリデーション' do
    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが24文字以上だとNG' do
      @user.name = 'a' * 25
      expect(@user.valid?).to eq(false)
    end

    it 'nameがユニークでなければNG' do
      user = User.new(name: 'testuser1', email: 'test2@hoge.com', password: 'password' )
      expect(user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが正規表現に反していたらNG' do
      @user.email = 'hogehoge'
      expect(@user.valid?).to eq(false)
    end

    it 'emailがユニークでなければNG' do
      user = User.new(name: 'testuser2', email: 'test@hoge.com', password: 'password' )
      expect(user.valid?).to eq(false)
    end

    it 'profileが256文字以上だとNG' do
      @user.profile = 'a' * 256
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @user.password = '' * 256
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが6文字未満だとNG' do
      @user.password = 'a'
      expect(@user.valid?).to eq(false)
    end

    it 'nameが24文字未満でユニーク、かつemailが正規表現に沿ったものでユニーク、
    かつprofileが256文字未満、かつpasswordが6文字以上であればOK' do
      user = User.new(name: 'testuser2', email: 'test2@hoge.com', profile: '初めまして', password: 'password' )
      expect(user.valid?).to eq(true)
    end
  end
end

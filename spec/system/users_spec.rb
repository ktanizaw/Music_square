require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  describe 'ユーザー登録機能' do
    before do
    visit new_user_registration_path
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_confirmation
    click_button 'サインアップ'
    end

    context 'ユーザー情報が正しく入力される' do
      let(:name) { 'テスト太郎' }
      let(:email) { 'example@sample.com' }
      let(:password) { '111111' }
      let(:password_confirmation) { '111111' }
      it 'ユーザー登録が完了する。' do
      expect(page).to have_content 'こんな掲示板があります'
      end
    end

    context 'ユーザー情報が入力されない' do
      let(:name) { '' }
      let(:email) { '' }
      let(:password) { '' }
      let(:password_confirmation) { '' }
      it 'エラーメッセージが表示される' do
      expect(page).to have_content '登録できませんでした。'
      end
    end
  end

  describe 'テストユーザーログイン機能' do
    let!(:test_user) { FactoryBot.create(:test_user) }

    context "サインアップ画面でテストユーザーボタンを押した場合" do
      it "テストユーザーでログインできる。" do
      visit new_user_registration_path
      click_button "テストユーザーでログイン"
      expect(page).to have_content 'こんな掲示板があります'
      end
    end

    context "ログイン画面でテストユーザーボタンを押した場合" do
      it "テストユーザーでログインできる。" do
      visit new_user_session_path
      click_button "テストユーザーでログイン"
      expect(page).to have_content 'こんな掲示板があります'
      end
    end
  end

  describe 'ユーザーログイン機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'ログイン'
    end

    context "ログイン情報が正しく入力される" do
      let(:email) { 'test@hoge.com' }
      let(:password) { 'password' }
      it "ログインに成功する。" do
      expect(page).to have_content 'こんな掲示板があります'
      end
    end

    context "ログイン情報が正しく入力されない" do
      let(:email) { '' }
      let(:password) { '' }
      it "エラーメッセージが表示される" do
      expect(page).to have_content 'ログインに失敗しました。'
      end
    end
  end

  describe 'ユーザー情報編集機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test@hoge.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end

    context "変更情報が正しく入力される" do
      it "ユーザー情報が更新される" do
      visit edit_user_path(user.id)
      fill_in 'user[email]', with: 'henkou@hoge.com'
      click_button '更新する'
      expect(page).to have_content 'ユーザー情報を編集しました。'
      end
    end

    context "変更情報が正しく入力されない" do
      it "ユーザー情報更新に失敗する" do
      visit edit_user_path(user.id)
      fill_in 'user[email]', with: ''
      click_button '更新する'
      expect(page).to have_content '更新できませんでした。'
      end
    end

    context "ユーザー退会ボタンを押す" do
      it "ユーザー情報が削除される" do
      visit user_path(user.id)
      click_button '退会する'
      expect {
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '退会しました。'
      }
      end
    end
  end
end

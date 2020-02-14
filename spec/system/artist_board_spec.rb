require 'rails_helper'

RSpec.describe 'アーティスト掲示板管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:artist_board) { FactoryBot.create(:artist_board) }
  let!(:artist_board_second) { FactoryBot.create(:artist_board_second) }

    describe 'アーティスト掲示板絞り込み機能' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@hoge.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
    context 'アーティスト名で検索する' do
      it '該当のアーティストのみ表示される' do
        fill_in 'artists', with: 'テストバンド'
        click_button '掲示板を検索する'
        expect(page).not_to have_content 'テストグループ'
      end
    end
  end

    describe 'アーティスト掲示板作成機能' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@hoge.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
    context 'アーティスト名でAPI検索する' do
      it '該当のアーティスト一覧が表示される' do
        visit search_artist_boards_path
        fill_in 'search', with: 'ビートルズ'
        click_button 'アーティスト名検索'
        expect(page).to have_content 'ビートルズ', 'The Beatles'
      end
    end

    context 'アーティスト掲示板作成ボタンから登録ボタンを押す' do
      it 'アーティスト掲示板が登録される' do
        visit search_artist_boards_path
        fill_in 'search', with: 'ビートルズ'
        click_button 'アーティスト名検索'
        target = find(:css, "a[id='link-0']")
        target.click
        click_button '登録する'
        expect(page).to have_content 'アーティスト掲示板を新規作成しました。'
      end
    end
  end
end

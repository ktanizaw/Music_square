require 'rails_helper'

RSpec.describe 'アーティスト掲示板管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:artist_board) { FactoryBot.create(:artist_board) }
  let!(:artist_board_second) { FactoryBot.create(:artist_board_second) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@hoge.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
  end

    describe 'アーティスト掲示板一覧画面' do
    context 'アーティスト名で検索する場合' do
      it '検索ワードが該当するときアーティスト掲示板が表示される' do
        fill_in 'artists', with: 'テストバンド'
        click_button '掲示板を検索する'
        expect(page).to have_content 'テストバンド'
      end
      it '検索ワードに該当しないときアーティスト掲示板が表示されない' do
        fill_in 'artists', with: 'test'
        click_button '掲示板を検索する'
        expect(page).not_to have_content 'テストバンド','テストグループ'
      end
    end

    context 'アーティスト掲示板をカテゴリで絞り込む場合' do
      it '該当カテゴリの含まれたアーティスト掲示板が表示される' do
      select 'カテゴリ１', from: 'category_id'
      expect(page).to have_content 'テストバンド'
      end
    end
  end

    describe 'アーティスト掲示板検索・作成画面' do
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

  describe 'アーティスト掲示板詳細画面' do
    context 'ファンになるボタンを押した場合' do
      it 'ファン登録が完了する' do
        visit artist_board_path(artist_board.artists)
        click_link 'ファンになる'
        expect(page).to have_content 'テストバンドをファン登録しました！'
      end
    end

    context 'ファン解除ボタンを押した場合' do
      it 'ファン解除が完了する' do
        visit artist_board_path(artist_board.artists)
        click_link 'ファンになる'
        click_link 'ファン解除'
        expect(page).to have_content 'テストバンドのファン登録を解除しました。'
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'イベント管理機能', type: :system do
  let!(:event) { FactoryBot.create(:event) }
  let!(:event_second) { FactoryBot.create(:event_second) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@hoge.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
  end

  describe 'イベント一覧画面' do
    before do
      visit events_path
    end
      context 'イベント名に含まれる検索ワードで検索する' do
        it '該当のイベントが表示される' do
          fill_in 'title', with: '交流会'
          click_button 'イベントを検索する'
          expect(page).to have_content '交流会'
        end
      end

      context 'イベント名に含まれない検索ワードで検索する' do
        it 'イベントが表示されない' do
          fill_in 'title', with: 'あああ'
          click_button 'イベントを検索する'
          expect(page).not_to have_content '交流会'
        end
      end

      context 'イベントをラベルで絞り込む' do
        it '該当ラベルの含まれたイベントが表示される' do
          select 'ラベル１', from: 'label_id'
          expect(page).to have_content '交流会'
      end
    end
  end

  describe 'イベント詳細画面' do
    before do
      visit artist_board_event_path(event_second.artist_board.artists, event_second)
    end

      context 'イベント参加ボタンを押した場合' do
        it 'イベント参加が完了する' do
          click_link '参加する'
          expect(page).to have_content 'イベントへの参加申請が完了しました！'
        end
      end

      context 'イベント参加取消ボタンを押した場合' do
        it 'イベント参加取消が完了する' do
          click_link '参加する'
          click_link '参加取消'
          expect(page).to have_content 'イベントへの参加を取り消しました！'
        end
      end
    end
end

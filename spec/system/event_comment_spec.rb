require 'rails_helper'

RSpec.describe 'イベントコメント管理機能', type: :system do
  let!(:test_user) { FactoryBot.create(:test_user) }
  let!(:event) { FactoryBot.create(:event) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@hoge.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
    visit artist_board_event_path(event.artist_board.artists, event)
  end

  describe 'イベントコメント一覧画面' do
    context '正しい入力でコメント投稿ボタンを押した場合' do
      it 'コメントがコメント一覧に表示される' do
        fill_in 'event_comment[content]', with: 'イベントコメント'
        click_button '投稿する'
        expect(page).to have_content 'イベントコメント'
        end
      end

    context '不備のある入力でコメント投稿ボタンを押した場合' do
      it 'エラーメッセージが表示される' do
      click_button '投稿する'
      expect(page).to have_content '空欄では投稿できません。'
      end
    end

    context 'コメント削除ボタンを押した場合' do
      it 'コメントがコメント一覧から削除される' do
      EventComment.create(content: "test1", user_id: event.owner_id, event_id: event.id)
      visit artist_board_event_path(event.artist_board.artists, event)
      find(".event-comment").click
      expect {
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'test1'
      }
      end
    end

    context '自分以外のユーザーのコメントがある場合' do
      it '削除ボタンは表示されない' do
      EventComment.create(content: "テストコメント", user_id: test_user.id, event_id: event.id)
      visit artist_board_event_path(event.artist_board.artists, event)
      expect(page).not_to have_css '.event-comment'
      end
    end
  end
end

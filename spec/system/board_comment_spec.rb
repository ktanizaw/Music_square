require 'rails_helper'

RSpec.describe '掲示板コメント管理機能', type: :system do
  let!(:board_comment) { FactoryBot.create(:board_comment) }
  let!(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@hoge.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
    visit artist_board_path(board_comment.artist_board.artists)
  end

  describe '掲示板コメント一覧画面' do
    context '正しい入力でコメント投稿ボタンを押した場合' do
      it 'コメントがコメント一覧に表示される' do
      fill_in 'board_comment[content]', with: 'テストコメント'
      click_button '投稿する'
      expect(page).to have_content 'テストコメント'
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
      BoardComment.create(content: "テストコメント", user_id: user.id, artist_board_id: board_comment.artist_board.id)
      visit artist_board_path(board_comment.artist_board.artists)
      click_link '削除'
      expect {
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'テストコメント'
      }
      end
    end

    context '自分以外のユーザーのコメントがある場合' do
      it '削除ボタンは表示されない' do
      expect(page).not_to have_content '削除'
      end
    end

    context '掲示板コメントへのいいね機能' do
      it "いいねしていない場合、いいねができる", js: true do
        find('.flash').click
        expect(page).to have_css '.heartBeat'
      end
    end

    context '掲示板コメントへのいいね機能' do
      it "いいねしている場合、いいね解除ができる", js: true do
        Favorite.create(user_id: user.id, board_comment_id: board_comment.id)
        visit artist_board_path(board_comment.artist_board.artists)
        find('.heartBeat').click
        expect(page).to have_css '.flash'
      end
    end
  end
end

require 'rails_helper'

RSpec.describe BoardComment, type: :model do
  before do
    @user = create(:user)
    @artistboard = create(:artist_board)
    @boardcomment = @artistboard.board_comments.build(content: '掲示板にコメント')
    @boardcomment.user_id = @user.id
  end

  describe 'バリデーション' do
    it 'contentが空だとNG' do
      @boardcomment.content = ''
      expect(@boardcomment.valid?).to eq(false)
    end

    it 'contentが256文字以上だとNG' do
      @boardcomment.content = 'a' * 256
      expect(@boardcomment.valid?).to eq(false)
    end

    it 'user_idが空だとNG' do
      boardcomment = @artistboard.board_comments.build(content: '掲示板にコメント')
      expect(boardcomment.valid?).to eq(false)
    end

    it 'artist_board_idが空だとNG' do
      boardcomment = @user.board_comments.build(content: '掲示板にコメント')
      expect(boardcomment.valid?).to eq(false)
    end

    it 'contentが256文字未満でuser_idとartist_board_idが紐付いていればOK' do
      expect(@boardcomment.valid?).to eq(true)
    end
  end
end

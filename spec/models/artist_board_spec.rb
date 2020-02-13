require 'rails_helper'

RSpec.describe ArtistBoard, type: :model do
  before do
    @artistboard = create(:artist_board)
  end

  describe 'アーティスト掲示板作成機能' do
    it '問題なくAPIからデータが読み込まれればOK' do
      expect(@artistboard.valid?).to eq(true)
    end
  end
end

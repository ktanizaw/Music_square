require 'rails_helper'

RSpec.describe EventComment, type: :model do
  before do
    @user = create(:user)
    @artistboard = create(:artist_board)
    @event = @artistboard.events.build(
      title: '交流会', place: '東京', date:'2020-12-30 00:00:00',
       content:'交流しましょう', deadline:'2020-02-12 00:00:00', capacity: 1)
    @event.owner_id = @user.id
    @eventcomment = @event.event_comments.build(content: 'イベントにコメント', user_id: @user.id )
  end

  describe 'バリデーション' do
    it 'contentが空だとNG' do
      @eventcomment.content = ''
      expect(@eventcomment.valid?).to eq(false)
    end

    it 'contentが256文字以上だとNG' do
      @eventcomment.content = 'a' * 256
      expect(@eventcomment.valid?).to eq(false)
    end

    it 'user_idが空だとNG' do
      eventcomment = @event.event_comments.build(content: 'イベントにコメント')
      expect(eventcomment.valid?).to eq(false)
    end

    it 'event_idが空だとNG' do
      eventcomment = @user.event_comments.build(content: 'イベントにコメント')
      expect(eventcomment.valid?).to eq(false)
    end

    it 'contentが256文字未満で入力され、かつuser_idとevent_idが紐付いていればOK' do
      expect(@eventcomment.valid?).to eq(true)
    end
  end
end

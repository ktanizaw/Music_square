require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = create(:user)
    @artistboard = create(:artist_board)
    @event = @artistboard.events.create(
      title: '交流会', place: '東京', date:'2020-12-30 00:00:00',
       content:'交流しましょう', deadline:'2020-02-12 00:00:00', capacity: 1)
    @event.owner_id = @user.id
  end

  describe 'バリデーション' do
    it 'titleが空だとNG' do
      @event.title = ''
      expect(@event.valid?).to eq(false)
    end

    it 'titleが33文字以上だとNG' do
      @event.title = 'a' * 33
      expect(@event.valid?).to eq(false)
    end

    it 'placeが空だとNG' do
      @event.place = ''
      expect(@event.valid?).to eq(false)
    end

    it 'placeが33文字以上だとNG' do
      @event.place = 'a' * 33
      expect(@event.valid?).to eq(false)
    end

    it 'contentが空だとNG' do
      @event.content = ''
      expect(@event.valid?).to eq(false)
    end

    it 'contentが256文字以上だとNG' do
      @event.title = 'a' * 256
      expect(@event.valid?).to eq(false)
    end

    it 'deadlineが空だとNG' do
      @event.title = ''
      expect(@event.valid?).to eq(false)
    end

    it 'owner_idが空だとNG' do
      @event.owner_id = ''
      expect(@event.valid?).to eq(false)
    end

    it 'artist_board_idが空だとNG' do
      @event = Event.create(
        title: '交流会', place: '東京', date:'2020-12-30 00:00:00',
         content:'交流しましょう', deadline:'2020-02-12 00:00:00', capacity: 1)
      @event.owner_id = @user.id
      expect(@event.valid?).to eq(false)
    end

    it 'titleとplaceが33文字未満で空ではない、かつcontentが256文字未満で空ではない、
    かつdeadlineが空ではない、かつowner_idとartist_board_idが紐付けられてればOK' do
      expect(@event.valid?).to eq(true)
    end
  end
end

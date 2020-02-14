class ParticipantsController < ApplicationController
  before_action :set_event

  def create
    @participant = current_user.participants.build(event_id: @event.id)
    @participant.save
    redirect_to artist_board_event_path(@event.artist_board.artists, @event), notice: 'イベントへの参加申請が完了しました！'
  end

  def destroy
    @participant = Participant.find_by(user_id: current_user.id, event_id: params[:id]).destroy
    redirect_to artist_board_event_path(@event.artist_board.artists, @event), notice: 'イベントへの参加を取り消しました！'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end

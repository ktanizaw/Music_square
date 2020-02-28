class EventCommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  def create
    @eventcomment = @event.event_comments.build(eventcomment_params)
    @eventcomment.user_id = current_user.id
    if @eventcomment.save
      render 'index.js.erb'
    else
      redirect_to artist_board_event_path(@event.artist_board.artists, @event), alert: '空欄では投稿できません。'
    end
  end

  def destroy
    @eventcomment = current_user.event_comments.find(params[:id])
    if @eventcomment.destroy
      render 'index.js.erb'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def eventcomment_params
    params.require(:event_comment).permit(:event_id, :content)
  end
end

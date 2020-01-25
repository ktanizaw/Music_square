class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @participant = current_user.participants.find_by(event_id: @event.id)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    redirect_to @event, notice: 'イベントを新規作成しました。'
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'イベントを削除しました。'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :place, :date, :content, :deadline, :capacity, :image, :image_cache)
    end
end

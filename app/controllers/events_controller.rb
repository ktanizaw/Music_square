class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_artistboard, only: [:show, :edit, :update, :create, :destroy]
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  PER_EVENT = 6
  PER_EVENT_COMMENT = 5

  def index
    @events = Event.all.includes([:labels]).order(updated_at: "DESC").page(params[:page]).per(PER_EVENT)
    @events = @events.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    if params[:title].present?
      @events = @events.get_by_title params[:title]
    end
    if params[:sorts].present?
      @events = Event.all.includes([:labels]).order(params[:sorts]).page(params[:page]).per(PER_EVENT)
    end
  end

  def new
    @event = Event.new
    @artistboard = ArtistBoard.find_by(artists: params[:artist_board_id])
  end

  def show
    @participant = current_user.participants.find_by(event_id: @event.id)
    @eventcomment = EventComment.new
    @eventcomments = @event.event_comments.includes([:user]).order(id: "DESC").page(params[:page]).per(PER_EVENT_COMMENT)
  end

  def edit
  end

  def create
    @event = @artistboard.events.build(event_params)
    @event.owner_id = current_user.id
    if @event.save
      redirect_to artist_board_path(@artistboard.artists)
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to artist_board_event_path(@artistboard.artists, @event.id), notice: 'イベント情報を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'イベントを削除しました。'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_artistboard
    @artistboard = ArtistBoard.find_by(artists: params[:artist_board_id])
  end

  def event_params
    params.require(:event).permit(:artist_board_id, :owner_id, :title, :place, :date, :content, :deadline, :capacity, :image, :image_cache, { label_ids: [] })
  end

  def ensure_correct_user
    if @event.owner_id != current_user.id
      redirect_to events_path, notice: "権限がありません"
    end
  end
end

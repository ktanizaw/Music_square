class ArtistBoardsController < ApplicationController
  before_action :set_artistboard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_admin, only: [:edit]

  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  PER_BOARD = 6
  PER_COMMENT = 5
  PER_EVENT = 5

  def index
    @artistboards = ArtistBoard.all.includes([:categorizes]).includes([:categories]).page(params[:page]).per(PER_BOARD)
    @artistboards = @artistboards.joins(:categories).where(categories: { id: params[:category_id] }) if params[:category_id].present?
    if params[:artists].present?
      @artistboards = @artistboards.get_by_artists params[:artists]
    end
  end

  def search
    @artistboards = ArtistBoard.all
    if params[:search].present?
    @searchartists = RSpotify::Artist.search(params[:search])
    end
  end

  def new
    @artistboard = ArtistBoard.new(artists: params[:artists])
    @artist_icon = params[:icon]
    @artist_genres = params[:category]
  end

  def show
    @boardcomment = BoardComment.new
    @boardcomments = @artistboard.board_comments.includes([:user]).order(id: "DESC").page(params[:boardcomment_page]).per(PER_COMMENT)
    @event = Event.new
    @events = @artistboard.events.includes([:labellings]).includes([:labels]).order(id: "DESC").page(params[:event_page]).per(PER_EVENT)
    @fan = current_user.fans.find_by(artist_board_id: @artistboard.id)
  end

  def edit
  end

  def create
    @artistboard = ArtistBoard.new(artistboard_params)
    @artistboard.remote_icon_url = params[:artist_icon]
    if @artistboard.save
      redirect_to @artistboard, notice: 'アーティスト掲示板を新規作成しました。'
    else
      render :new
    end
  end

  def update
    if @artistboard.update(artistboard_params)
      redirect_to @artistboard, notice: 'アーティスト掲示板を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @artistboard.destroy
    redirect_to artist_boards_path, notice: 'アーティスト掲示板を削除しました。'
  end

  private

  def set_artistboard
    @artistboard = ArtistBoard.find_by(artists: params[:artists])
  end

  def artistboard_params
    params.require(:artist_board).permit(:artists, :albums, :profiles, :icon, :icon_cache, { category_ids: [] })
  end

  def user_admin
    unless  current_user.admin?
      redirect_to artist_boards_path, notice: "権限がありません"
    end
  end
end

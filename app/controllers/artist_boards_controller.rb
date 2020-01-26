class ArtistBoardsController < ApplicationController
  before_action :set_artistboard, only: [:show, :edit, :update, :destroy]

  def index
    @artistboards = ArtistBoard.all
    @artistboards = @artistboards.joins(:categories).where(categories: { id: params[:category_id] }) if params[:category_id].present?
    if params[:artists].present?
      @artistboards = @artistboards.get_by_artists params[:artists]
    end
  end

  def new
    @artistboard = ArtistBoard.new
  end

  def show
    @boardcomment = BoardComment.new
    @boardcomments = @artistboard.board_comments
    @event = Event.new
    @events = @artistboard.events
    @fan = current_user.fans.find_by(artist_board_id: @artistboard.id)
  end

  def edit
  end

  def create
    @artistboard = ArtistBoard.new(artistboard_params)

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
    redirect_to artistboards_url, notice: 'アーティスト掲示板を削除しました。'
  end

  private
  def set_artistboard
    @artistboard = ArtistBoard.find(params[:id])
  end

  def artistboard_params
    params.require(:artist_board).permit(:artists, :albums, :profiles, :icon, :icon_cache, { category_ids: [] })
  end

end

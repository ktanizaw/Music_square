class ArtistBoardsController < ApplicationController
  before_action :set_artistboard, only: [:show, :edit, :update, :destroy]

  def index
    @artistboards = ArtistBoard.all
  end

  def show
  end

  def new
    @artistboard = ArtistBoard.new
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
      params.require(:artist_board).permit(:artists, :albums, :profiles, :icon, :icon_cache)
    end
end

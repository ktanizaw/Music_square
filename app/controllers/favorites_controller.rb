class FavoritesController < ApplicationController
  before_action :set_boardcomment
  # def create
  #   favorite = current_user.favorites.create(board_comment_id: params[:board_comment_id])
  #   @board_comment_artist_board = BoardComment.find(favorite.board_comment_id)
  #   redirect_to artist_board_path(@board_comment_artist_board.artist_board.id)
  #   # respond_to do |format|
  #   #   if favorite.save
  #   #     format.js { render :index }
  #   #   else
  #   #     format.html { redirect_to artist_board_path(@board_comment_artist_board.artist_board.id), notice: '投稿できませんでした...' }
  #   #   end
  # end
  #
  # def destroy
  #   favorite = current_user.favorites.find_by(board_comment_id: params[:id]).destroy
  #   @board_comment_artist_board = BoardComment.find(favorite.board_comment_id)
  #   redirect_to artist_board_path(@board_comment_artist_board.artist_board.id)
  #   # respond_to do |format|
  #   #   if favorite.destory
  #   #     format.js { render :index }
  #   #   end
  # end
  #  before_action :set_boardcomment

  def create
    @favorite = Favorite.create(user_id: current_user.id, board_comment_id: params[:id])
    @favorites = Favorite.where(board_comment_id: params[:id])
    redirect_to artist_board_path(@boardcomment.artist_board_id)
    binding.irb
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, board_comment_id: params[:id]).destroy
    @favorites = Favorite.where(board_comment_id: params[:id])
    redirect_to artist_board_path(@boardcomment.artist_board_id)
  end

  private

  def set_boardcomment
    @boardcomment = BoardComment.find(params[:id])
  end
end

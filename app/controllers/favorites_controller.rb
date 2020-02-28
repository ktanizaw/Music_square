class FavoritesController < ApplicationController
  before_action :set_boardcomment

  def create
    @favorite = current_user.favorites.create(board_comment_id: params[:id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(board_comment_id: params[:id]).destroy
  end

  private

  def set_boardcomment
    @boardcomment = BoardComment.find(params[:id])
  end
end

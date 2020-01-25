class FavoritesController < ApplicationController
  before_action :set_boardcomment

  def create
    @favorite = Favorite.create(user_id: current_user.id, board_comment_id: params[:id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, board_comment_id: params[:id]).destroy
  end

  private

  def set_boardcomment
    @boardcomment = BoardComment.find(params[:id])
  end
end

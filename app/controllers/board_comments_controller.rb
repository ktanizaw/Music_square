class BoardCommentsController < ApplicationController
  before_action :set_artistboard, only: [:create, :destroy]

  PER_COMMENT = 5

  def create
    @boardcomment = @artistboard.board_comments.build(boardcomment_params)
    @boardcomments = @artistboard.board_comments.includes([:user]).order(id: "DESC").page(params[:boardcomment_page]).per(PER_COMMENT)
    @boardcomment.user_id = current_user.id
    if @boardcomment.save
      render 'index.js.erb'
    else
      redirect_to artist_board_path(@artistboard), alert: '空欄では投稿できません。'
    end
  end

  def destroy
    @boardcomment = current_user.board_comments.find(params[:id])
    if @boardcomment.destroy
      render 'index.js.erb'
    end
  end

  private

  def set_artistboard
    @artistboard = ArtistBoard.find_by(artists: params[:artist_board_id])
  end

  def boardcomment_params
    params.require(:board_comment).permit(:artist_board_id, :user_id, :content, :picture, :picture_cache)
  end
end

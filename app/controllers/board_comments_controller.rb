class BoardCommentsController < ApplicationController
  before_action :set_artistboard, only: [:edit, :create, :update, :destroy]
  before_action :set_boardcomments, only: [:index, :create, :update, :destroy]

  PER_COMMENT = 5

  def index
  end

  def edit
    @boardcomment = current_user.board_comments.find(params[:id])
  end

  def create
    @boardcomment = @artistboard.board_comments.build(boardcomment_params)
    @boardcomment.user_id = current_user.id
    if @boardcomment.save
      render 'index.js.erb'
    else
      redirect_to artist_board_path(@artistboard), alert: '空欄では投稿できません。'
    end
  end

  def update
    @boardcomment = current_user.board_comments.find(params[:id])
    if @boardcomment.update(boardcomment_params)
      render 'update.js.erb'
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

  def set_boardcomments
    @boardcomments = @artistboard.board_comments.includes([:user]).order(id: "DESC").page(params[:boardcomment_page]).per(PER_COMMENT)
  end

  def set_artistboard
    @artistboard = ArtistBoard.find_by(artists: params[:artist_board_id])
  end

  def boardcomment_params
    params.require(:board_comment).permit(:artist_board_id, :user_id, :content, :picture, :picture_cache)
  end
end

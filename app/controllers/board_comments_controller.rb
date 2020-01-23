class BoardCommentsController < ApplicationController
    def create
      @artistboard = ArtistBoard.find(params[:artist_board_id])
      @boardcomment = @artistboard.board_comments.build(boardcomment_params)
      @boardcomment.user_id = current_user.id
      respond_to do |format|
        if @boardcomment.save
          format.js { render :index }
        else
          format.html { redirect_to artist_board_path(@artistboard), notice: '投稿できませんでした...' }
        end
      end
    end

    def destroy
      @boardcomment = BoardComment.find(params[:id])
      respond_to do |format|
        if @boardcomment.destroy
          format.js { render :index }
        end
      end
    end

    private

    def boardcomment_params
      params.require(:board_comment).permit(:artist_board_id, :user_id, :content)
    end
  end

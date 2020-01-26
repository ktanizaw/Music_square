class EventCommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

    def create
      @eventcomment = @event.event_comments.build(eventcomment_params)
      @eventcomment.user_id = current_user.id
      respond_to do |format|
        if @eventcomment.save
          format.js { render :index }
        else
          format.html { redirect_to event_path(@event), notice: '投稿できませんでした...' }
        end
      end
    end

    def destroy
      @eventcomment = EventComment.find(params[:id])
      respond_to do |format|
        if @eventcomment.destroy
          format.js { render :index }
        end
      end
    end

    private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def eventcomment_params
      params.require(:event_comment).permit(:event_id, :user_id, :content)
    end
  end

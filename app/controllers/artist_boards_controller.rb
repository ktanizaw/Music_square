class ArtistBoardsController < ApplicationController
  def index
    @artistboards = ArtistBoard.all
  end

  def new
    @artistboard = ArtistBoard.new
  end

  def create
    Blog.create(title: params[:artistboard][:], content: params[:blog][:content])
  end
end

class FansController < ApplicationController
  def create
    fan = current_user.fans.create(artist_board_id: params[:artist_board_id])
    redirect_to artist_board_path(fan.artist_board.artists), notice: "#{fan.artist_board.artists}のファンになりました！"
  end

  def destroy
    fan = current_user.fans.find_by(id: params[:id]).destroy
    redirect_to artist_board_path(fan.artist_board.artists), notice: "#{fan.artist_board.artists}のファンを辞めました。"
  end
end

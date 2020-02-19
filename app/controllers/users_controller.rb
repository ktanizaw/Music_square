class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]

  PER_USER = 10
  PER_BOARD = 8

  def index
    @users = User.all.page(params[:page]).per(PER_USER)
  end

  def show
    @fan_artists = @user.fan_artistboards.includes(:categories).page(params[:page]).per(PER_BOARD)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image, :profile_image_cache, :password_digest)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to users_path, notice: "権限がありません"
    end
  end
end

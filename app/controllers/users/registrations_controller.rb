# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to artist_boards_path
    else
      render :new
    end
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
     super
  end

  # protected
  #
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  #
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  #
  # def after_sign_up_path_for(resource)
  #     super(resource)
  #   end
  #
  # def after_inactive_sign_up_path_for(resource)
  #  super(resource)
  # end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:name, :email, :profile, :profile_image, :profile_image_cache, :encrypted_password, :password, :password_confirmation)
    end
end

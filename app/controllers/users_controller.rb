class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :remove_photo]
  before_action :authorize_user, only: [:show, :remove_photo]

  def show
    @grandmoms_owned = Grandmom.where(user_id: current_user)
    @bookings = Booking.where(user_id: current_user)
    @user = current_user
  end

  def update
    authorize @user
    @user = current_user
    @user.update(current_user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end

  def remove_photo
    @user = current_user
    @user.remove_photo!
    @user.save
    redirect_to user_path(@user)
  end

private

  def current_user_params
    params.require(:user).permit(:email, :photo)
  end

  def authorize_user
    authorize @user
  end

  def set_user
    @user = User.find(params[:id])
  end
end

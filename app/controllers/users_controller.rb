class UsersController < ApplicationController
  def show
    @grandmoms_owned = Grandmom.where(user_id: current_user)
    @bookings = Booking.where(user_id: current_user)

  end
end

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :set_grandmom, only: [:show, :destroy, :new, :create]
  before_action :authorize_booking, only: [:show]

  def index

    @bookings = policy_scope(Booking)
    # @bookings = Booking.all
  end

  def show

  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.grandmom_id = params[:grandmom_id]
    if @booking.save
      redirect_to grandmom_booking_path(@grandmom, @booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :grandmom_id, :user_id)
  end

  def set_grandmom
    # raise
    @grandmom = Grandmom.find(params[:grandmom_id])
    # raise
  end

  def authorize_booking
    authorize @booking
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

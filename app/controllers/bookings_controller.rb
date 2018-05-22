class BookingsController < ApplicationController
  before_action :set_grandmom, only: [:show, :destroy, :new, :create]
  before_action :authorize_grandmom, only: [:create, :show, :destroy, :new]

  def index
    @bookings = policy_scope(set_grandmom)
    # @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.user_id = current_user.id
    @booking.grandmom_id = params[:grandmom_id]
    if @booking.save
      redirect_to grandmom_booking_path(id: @booking.id)
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
    @booking.destroy
    redirect_to bookings_path
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :grandmom_id, :user_id)
  end

  def set_grandmom
    @grandmom = Grandmom.find(params[:grandmom_id])
  end

  def authorize_grandmom
    authorize @grandmom
  end
end

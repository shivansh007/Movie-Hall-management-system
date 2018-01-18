class BookingsController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    bookings = Booking.all
    render json: { message: 'Bookings loaded', bookings: bookings }, status: :ok
  end

  def show
    booking = Booking.find(params[:id])
    render json: { message: 'Booking loaded', booking: booking }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Booking not found' }, status: :not_found
  end

  def create
    booking = Booking.create(booking_params)
    if booking.save
      render json: { message: 'Booking created', booking: booking }, status: :ok
    else
      render json: { message: booking.errors }, status: :unprocessable_entity
    end
  end

  def update
    booking = Booking.find(params[:id])
    if booking.update_attributes(booking_params)
      render json: { message: 'Booking updated', booking: booking }, status: :ok
    else
      render json: { message: booking.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Booking not found' }, status: :not_found
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    render json: { message: 'Booking deleted', booking: booking }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Booking not found' }, status: :not_found
  end

  private

  def booking_params
    params.require(:booking).permit(:movie_id, :user_id, :booking_time)
  end
end

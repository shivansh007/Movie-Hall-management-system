class SeatsController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    seats = Seat.all
    render json: { message: 'Seats loaded', seats: seats }, status: :ok
  end

  def show
    seat = Seat.find(params[:id])
    render json: { message: 'Seat loaded', seat: seat }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Seat not found' }, status: :not_found
  end

  def create
    seat = Seat.create(seat_params)
    if seat.save
      render json: { message: 'Seat created', seat: seat }, status: :ok
    else
      render json: { message: seat.errors }, status: :unprocessable_entity
    end
  end

  def update
    seat = Seat.find(params[:id])
    if seat.update_attributes(seat_params)
      render json: { message: 'Seat updated', seat: seat }, status: :ok
    else
      render json: { message: seat.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Seat not found' }, status: :not_found
  end

  def destroy
    seat = Seat.find(params[:id])
    seat.destroy
    render json: { message: 'Seat deleted', seat: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Seat not found' }, status: :not_found
  end

  private

  def seat_params
    params.require(:seat).permit(:audi_id, :row_number, :seat_number)
  end
end

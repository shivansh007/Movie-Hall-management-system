class ShowTimesController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    show_times = ShowTime.all
    render json: { message: 'Show times loaded', show_times: show_times }, status: :ok
  end

  def show
    show_time = ShowTime.find(params[:id])
    render json: { message: 'Show time loaded', show_time: show_time }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Show time not found' }, status: :not_found
  end

  def create
    show_time = ShowTime.create(show_time_params)
    if show_time.save
      render json: { message: 'Show time created', show_time: show_time }, status: :ok
    else
      render json: { message: show_time.errors }, status: :unprocessable_entity
    end
  end

  def update
    show_time = ShowTime.find(params[:id])
    if show_time.update_attributes(show_time_params)
      render json: { message: 'Show time updated', show_time: show_time }, status: :ok
    else
      render json: { message: show_time.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Show time not found' }, status: :not_found
  end

  def destroy
    show_time = ShowTime.find(params[:id])
    show_time.destroy
    render json: { message: 'Show time deleted', show_time: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Show time not found' }, status: :not_found
  end

  private

  def show_time_params
    params.require(:show_time).permit(:movie_id, :audi_id, :start_time, :run_time)
  end
end

class MovieHallsController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    movie_halls = MovieHall.all
    render json: { message: 'Movie halls loaded', movie_halls: movie_halls }, status: :ok
  end

  def show
    movie_hall = MovieHall.find(params[:id])
    render json: { message: 'Movie hall loaded', movie_hall: movie_hall }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie hall not found' }, status: :not_found
  end

  def create
    movie_hall = MovieHall.create(movie_hall_params)
    if movie_hall.save
      render json: { message: 'Movie hall created', movie_hall: movie_hall }, status: :ok
    else
      render json: { message: movie_hall.errors }, status: :unprocessable_entity
    end
  end

  def update
    movie_hall = MovieHall.find(params[:id])
    if movie_hall.update_attributes(movie_hall_params)
      render json: { message: 'Movie hall updated', movie_hall: movie_hall }, status: :ok
    else
      render json: { message: movie_hall.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie hall not found' }, status: :not_found
  end

  def destroy
    movie_hall = MovieHall.find(params[:id])
    movie_hall.destroy
    render json: { message: 'Movie hall deleted', movie_hall: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie hall not found' }, status: :not_found
  end

  private

  def movie_hall_params
    params.require(:movie_hall).permit(:name, :address, :phone)
  end
end

class MoviesController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    movies = Movie.all
    render json: { message: 'Movies loaded', movies: movies }, status: :ok
  end

  def show
    movie = Movie.find(params[:id])
    render json: { message: 'Movie loaded', movie: movie }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie not found' }, status: :not_found
  end

  def create
    movie = Movie.create(movie_params)
    if movie.save
      render json: { message: 'Movie created', movie: movie }, status: :ok
    else
      render json: { message: movie.errors }, status: :unprocessable_entity
    end
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update_attributes(movie_params)
      render json: { message: 'Movie updated', movie: movie }, status: :ok
    else
      render json: { message: movie.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie not found' }, status: :not_found
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    render json: { message: 'Movie deleted', movie: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Movie not found' }, status: :not_found
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_date, :cast)
  end
end

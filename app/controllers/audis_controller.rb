class AudisController < ApplicationController
  protect_from_forgery only: %i[create update destroy]
  def index
    audis = Audi.all
    render json: { message: 'Audis loaded', audis: audis }, status: :ok
  end

  def show
    audi = Audi.find(params[:id])
    render json: { message: 'Audi loaded', audi: audi }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Audi not found' }, status: :not_found
  end

  def create
    audi = Audi.create(audi_params)
    if audi.save
      render json: { message: 'Audi created', audi: audi }, status: :ok
    else
      render json: { message: audi.errors }, status: :unprocessable_entity
    end
  end

  def update
    audi = Audi.find(params[:id])
    if audi.update_attributes(audi_params)
      render json: { message: 'Audi updated', audi: audi }, status: :ok
    else
      render json: { message: audi.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Audi not found' }, status: :not_found
  end

  def destroy
    audi = Audi.find(params[:id])
    audi.destroy
    render json: { message: 'Audi deleted', audi: audi }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Audi not found' }, status: :not_found
  end

  private

  def audi_params
    params.require(:audi).permit(:movie_hall_id, :audi_no)
  end
end

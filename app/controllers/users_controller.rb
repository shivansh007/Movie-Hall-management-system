class UsersController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    users = User.all
    render json: { message: 'Users loaded', users: users }, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: { message: 'User loaded', user: user }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :not_found
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: { message: 'User created', user: user }, status: :ok
    else
      render json: { message: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: { message: 'User updated', user: user }, status: :ok
    else
      render json: { message: user.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :not_found
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'User deleted', user: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :not_found
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email)
  end
end

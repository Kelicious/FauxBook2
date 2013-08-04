class UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(params[:user])

    if user.save
      render json: user, status: :created
    else
      render json: user
    end
  end

  def show
    render json: current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      render json: current_users
    else
      render json: user, status: :unprocessable_entity
    end
  end
end

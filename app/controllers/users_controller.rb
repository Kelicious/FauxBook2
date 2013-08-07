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
    user = params[:id] == 'current' ? current_user : User.find(params[:id])
    render json: user
  end

  def update
    if current_user.update_attributes(params[:user])
      render json: current_user
    else
      render json: user, status: :unprocessable_entity
    end
  end
end

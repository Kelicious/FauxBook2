class UsersController < ApplicationController
  respond_to :json

  def index
    if ids = params[:ids]
      render json: User.where(id: ids)
    else
      render json: User.all
    end
  end

  def create
    user = User.new(params[:user])

    if user.save
      render json: user, status: :created
    else
      render json: user
    end
  end

  def show
    id = params[:id] == "current" ? current_user.id : params[:id]
    user = User.where(id: id).includes(:friends,
                                       :friend_request_recipients,
                                       :friend_request_senders).first
    # user = params[:id] == 'current' ? current_user : User.find(params[:id])
    render json: user
  end

  def update
    if current_user.update_attributes(params[:user])
      render json: current_user
    else
      render json: user, status: :unprocessable_entity
    end
  end

  def friend_request
    user = User.find(params[:user_id])
    current_user.friend_request_recipients << user
    render json: user
  end

  def cancel_request
    user = User.find(params[:user_id])
    current_user.outgoing_friend_requests.find_by_recipient_id(user.id).destroy
    render json: user
  end

  def accept_request
    user = User.find(params[:user_id])
    current_user.incoming_friend_requests.find_by_sender_id(user.id).approve!
    render json: user
  end

  def reject_request
    user = User.find(params[:user_id])
    current_user.incoming_friend_requests.find_by_sender_id(user.id).destroy
    render json: user
  end

  def unfriend
    user = User.find(params[:user_id])
    user.friendships.find_by_friend_id(current_user.id).destroy!
    render json: user
  end
end

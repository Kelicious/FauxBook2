class PostsController < ApplicationController
  def index
    render json: Post.where(id: params[:ids])
  end

  def create
    post = current_user.authored_posts.new(params[:post])
    post.user_id = params[:user_id]
    post.save
    render json: post
  end
end

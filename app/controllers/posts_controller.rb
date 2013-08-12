class PostsController < ApplicationController
  def index
    posts = Post.where(id: params[:ids]).includes(:comments)
    render json: posts
  end

  def create
    post = current_user.authored_posts.new(params[:post])
    post.user_id = params[:user_id] if params[:user_id]
    post.save
    render json: post
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end
end

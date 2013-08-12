class CommentsController < ApplicationController
  def index
    render json: Comment.all
  end

  def create
    comment = current_user.comments.new(params[:comment])
    comment.post_id = params[:post_id] if params[:post_id]
    comment.save
    render json: comment
  end
end

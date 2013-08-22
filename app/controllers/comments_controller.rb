class CommentsController < ApplicationController
  def index
    render json: Comment.all
  end

  def create
    commentable = find_commentable
    comment = commentable.comments.new(params[:comment])
    comment.author = current_user
    comment.save
    render json: comment
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @comment = Image.find(params[:image_id]).comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    record_activity('comment')

    redirect_to category_image_path(id: params[:image_id]), remote: true
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image_id)
  end
end
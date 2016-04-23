class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to user_exercise_path(params[:user_nickname], params[:exercise_id])
    end
  end

  private
    def comment_params
      params.permit(:body, :user_id, :submission_id)
    end
end

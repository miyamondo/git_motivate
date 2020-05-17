class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], diary_id: params[:diary_id], user_id: current_user.id)
    redirect_to "/diaries/#{@comment.diary.id}"
  end
  
  private
  def comment_params
    params.permit(:text, :diary_id)
  end
end

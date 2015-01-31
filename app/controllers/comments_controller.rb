class CommentsController < ApplicationController
  
  def create
    @talk = Talk.find params[:talk_id]
    @comment = Comment.new comment_params
    @comment.talk = @talk
    @comment.save 
    redirect_to talk_path(@talk), notice: "Comment Created Successfully!"
  end

  def destroy
    @talk = Talk.find params[:talk_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to talk_path(@talk), notice: "Comment Deleted Successfully!"
  end


private
  
  def comment_params
    params.require(:comment).permit(:body)
  end

end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = 'New comment created successfully.'
      update_comments 
    else
      flash[:warning] = 'Failed to add comment. Please try again.'
      redirect_to projects_path(comment.project)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(params.permit(:project_id, :user_id))
  end

  def update_comments
    render turbo_stream: turbo_stream.replace("comments", partial: "projects/comments", object: @comment.project.comments)
  end
end

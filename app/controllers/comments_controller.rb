class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render turbo_stream: 
              turbo_stream.replace(
                "comments", 
                partial: "projects/comments", 
                locals: {
                  comments: @comment.project.comments,
                  comment: Comment.new(project_id: @comment.project.id, user_id: current_user.id)
                  }                
                )
    else
      render turbo_stream: 
      turbo_stream.replace(
        "comments", 
        partial: "projects/comments", 
        locals: {
          comments: @comment.project.comments,
          comment: @comment
}                )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(params.permit(:project_id, :user_id))
  end
end

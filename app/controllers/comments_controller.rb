class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        comment = Comment.new(comment_params)

        if comment.save
            flash[:success] = "New comment created successfully."
            redirect_to projects_path(comment.project)
        else
            flash[:warning] = "Failed to add comment. Please try again."
            redirect_to projects_path(comment.project)
        end 
    end

    private
    def comment_params
        params.require(:comment).permit(:text).merge(params.permit(:project_id, :user_id))
    end
end


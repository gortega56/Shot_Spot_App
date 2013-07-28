class CommentsController < ApplicationController

    def create
      if user_signed_in?
        safe_comment = params.require(:comment).permit(:body).merge(photo_id: params[:photo_id])
        @comment = current_user.comments.create safe_comment
        redirect_to @comment.photo
      else
        redirect_to new_user_session_path
      end
    end

end

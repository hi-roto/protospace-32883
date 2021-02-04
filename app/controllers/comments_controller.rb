class CommentsController < ApplicationController
  def create
      @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to  prototype_path(@comment.prototype.id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user, prototype_id: params[:prototype_id])
  end
end

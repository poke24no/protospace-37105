class CommentsController < ApplicationController

  def create
    
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototypes = @comment.prototype
      @comments = @prototypes.comments.includes(:user)
      render "prototypes/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end

# 1, proto --- comment 1
# 2, proto --- comment 2
# 3,
# 4,

# プロトに紐付いているユーザーprototype.user
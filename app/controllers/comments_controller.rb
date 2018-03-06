class CommentsController < ApplicationController
  def index
  end

  def create
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end

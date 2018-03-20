class CommentsController < ApplicationController

  def create
    binding.pry
    @comment = Comment.create(comment_params)
    if @comment.valid?
      @comment.post_id = params[:post_id]
      @comments = Comment.all.select{|comment| comment.post_id == @comment.post_id}
      @post = Post.find(params[:post_id])
      redirect_to post_path(@comment.post_id)
    else
      @comments = Comment.all.select{|comment| comment.post_id == @comment.post_id}
      @post = Post.find(params[:post_id])
      render :"/posts/show"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end

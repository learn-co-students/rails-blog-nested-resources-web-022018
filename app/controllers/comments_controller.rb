class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		redirect_to @comment.post
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :content)
	end
end

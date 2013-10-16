class CommentsController < ApplicationController

  	def create
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.new(comment_params)
    	@comment.user_id = 1

    	if @comment.save
      		flash[:notice] = "Your comment was created."
      		# http request for post/:id
      		redirect_to post_path(@post)
    	else
    		# show the view for the post to complete 
    		# create request action
      		render 'posts/show'
    	end
  	end

	private 

  	def comment_params
    	params.require(:comment).permit(:body)
  	end

end

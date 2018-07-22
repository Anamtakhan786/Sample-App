class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
    @user= User.new
  end

  def create
  	@micropost = Micropost.find(params[:micropost_id])
  	@comment = @micropost.comments.create(comment_params)
	if @comment.save
      CommentMailer.user_comment(@comment).deliver
	  	respond_to do |format| 
	  		format.html {redirect_to root_url}
	  		format.js
    end
  		#flash[:success] = "Comment created"
  		#redirect_to root_url
  	end
  end

  def destroy
    @comment = Comment.find(params[:id])
  	@comment.destroy
  	respond_to do |format|
  		format.html {redirect_to request.referrer || root_url}
  		format.js
    end
  	#flash[:success] = "Comment deleted"
  	#redirect_to request.referrer || root_url
  end

  private

 def comment_params
 	params.require(:comment).permit(:comment)
 end  
end

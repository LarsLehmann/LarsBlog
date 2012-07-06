class CommentsController < ApplicationController
  authorize_resource
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(params[:comment])

    redirect_to post_path(@post)
    
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    
      end
    end
end
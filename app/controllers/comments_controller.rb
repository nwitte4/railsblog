class CommentsController < ApplicationController
  before_action :authenticate
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @post, notice: 'Comment was successfully created.' }
    #   else
    #     format.html { redirect_to @post }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end

    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy
    redirect_to post_path(post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

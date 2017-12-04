class PostsController < ApplicationController
before_action :authenticate
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by_id(params[:id])
    if current_user.id != @post.user_id
      redirect_to '/posts'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

     respond_to do |format|
       if @post.save
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
       else
         format.html { render action: "new" }
         format.json { render json: @post.errors, status: :unprocessable_entity }
       end
     end
   end

   def update
     @post = Post.find_by_id(params[:id])

     if @post.update(post_params)
       redirect_to @post
     else
       render 'edit'
     end
   end

   def destroy
     post = Post.find(params[:id])
     post.destroy

     redirect_to posts_path
   end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

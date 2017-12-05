class UsersController < ApplicationController
  before_action :authenticate, only: [:show]

  def show
    @user = User.find_by_id(session[:user_id])
    @posts = current_user.posts
  end

  def new
    redirect_to '/', notice: "You are already logged in." if logged_in?
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    params[:user].delete(:password) if params[:user][:password].blank?
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit', notice: "An error occurred: \n#{@user.errors.full_messages.join(". ")}"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: "Successfully signed up!"
    else
      redirect_to '/signup', notice: "An error occurred: \n#{@user.errors.full_messages.join(". ")}"
    end
  end

  def destroy
    user = User.find_by_id(session[:user_id])
    user.destroy

    redirect_to '/signup', notice: "Account deleted!"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

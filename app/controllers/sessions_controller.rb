class SessionsController < ApplicationController

  def new
    redirect_to '/', notice: 'You are already logged in.' if logged_in?
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Welcome back.'
    else
      redirect_to '/signin', notice: 'Login Failed. Username or Password not recognized'
    end
  end

  def logout
    session.clear
    redirect_to '/signin', notice: 'Auf Wiedersehen.'
  end


end

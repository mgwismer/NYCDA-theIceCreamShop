class SessionsController < ApplicationController

  def new
  	#put the login form in this view
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
    	session[:user_id] = @user.id
    	redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root
  end
end

class SessionsController < ApplicationController

  def new
  	#put the login form in this view
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
    	session[:user_id] = @user.id
    	redirect_to "/users/#{@user.id}"
    else 
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end

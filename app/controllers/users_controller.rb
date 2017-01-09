class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def new
    @user = User.new
    Order.new
  end

  def create
    @user = User.create(user_params)
    Order.create(user_id: @user.id)
    Wishlist.create(user_id: @user.id)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:notice] = "Put correct email"
        redirect_to new_user_path
      end
    # redirect_to "/users/#{@user.id}"
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to "/users"
  end

  private

  def user_params
    params.require(:user).permit(:username, :address, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

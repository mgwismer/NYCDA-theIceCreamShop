class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    Order.new
  end

  def create
    @user = User.create(user_params)
    Order.create(user_id: @user.id)
    Wishlist.create(user_id: @user.id)
    redirect_to "/users/#{@user.id}"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :address, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

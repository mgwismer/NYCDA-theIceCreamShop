class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @orders = @user.orders
  end

  def new
    @user = User.new
    Order.new
  end

  def create
    @user = User.create(user_params)
    Wishlist.create(user_id: @user.id)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:notice] = "Put correct email"
        render new_user_path
      end
    # redirect_to "/users/#{@user.id}"
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "update successful"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to "/users"
  end

  private

  def user_params
    params.require(:user).permit(:username, :address, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def create_user_order
    Order.create(user_id: @user.id)
  end
end

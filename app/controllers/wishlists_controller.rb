class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
    redirect_to "/wishlists/:id"
  end

  def show
    @user = User.find(session[:user_id])
    @your_wishlist = @user.wishlists.find(params["id"])
  end

  def new
    @wishlist = Wishlist.new
    @products = Product.all
  end

  def create
    @user = User.find(session[:user_id])
    @products = Product.all
    @wishlist = Wishlist.create(user_id: @user.id, numitems: 0)
    (1..@products.length).each do |i|
     if (params["#{i}"]["id"] == "1")
       @product = Product.find(i)
       @wishlist.products.push(@product)
     end
    end
    redirect_to "/users/#{@user.id}"
  end

  def edit
  end

  def update
  end

  def destroy
    Wishlist.find(params[:id]).destroy
    flash[:success] = "wishlist deleted"
    redirect_to "/users/#{session[:user_id]}"
  end

  private

  def order_params
    params.require(:wishlist).permit(:user_id, :numitems)
  end
end

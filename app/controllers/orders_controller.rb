class OrdersController < ApplicationController
  def index
    @orders = Order.all
    redirect_to "/orders/:id"
  end

  def show
    @user = User.find(session[:user_id])
    @your_order = @user.orders.last
  end

  def new
    @order = Order.new
    @products = Product.all
  end

  def create
    @user = User.find(session[:user_id])
    @products = Product.all
    @order = Order.create(user_id: @user.id, numitems: 0, total: 0)
    (1..@products.length).each do |i|
     if (params["#{i}"]["id"] == "1")
       @product = Product.find(i)
       @order.products.push(@product)
     end
    end
    redirect_to "/orders/#{@user.id}"
  end

  def edit
  end

  def update
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "order deleted"
    redirect_to "/users/#{session[:user_id]}"
  end

  def add_to_order
    @product = Product.find(params[:id])
    @user.order.products.push(@product)
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :numitems, :total)
  end


end

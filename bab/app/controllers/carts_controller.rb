class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = current_cart
	@cart.destroy
	session[:cart_id] = nil
	redirect_to shop_index_path
  end
end

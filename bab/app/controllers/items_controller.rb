class ItemsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @cart = current_cart
	product = Product.find(params[:product_id])
    @item = @cart.add_product(product.id)
    if @item.save
	  redirect_to @item.cart
	else
	  render 'new'
	end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

	redirect_to current_cart
  end

  def decrement
    @cart = current_cart
	@item = @cart.decrement_item_quantity(params[:id])
    if @item.save
	  redirect_to current_cart
	end
  end

  def increment
    @cart = current_cart
	@item = @cart.increment_item_quantity(params[:id])
    if @item.save
	  redirect_to current_cart
	end
  end

  private
    def item_params
	  params.require(:item).permit(:product_id, :cart_id, :quantity)
	end
end

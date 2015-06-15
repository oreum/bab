class ShopController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end


  private
    def product_params
	  params.require(:product).permit(:title, :description, :price, :stock, :image_url)
	end
end

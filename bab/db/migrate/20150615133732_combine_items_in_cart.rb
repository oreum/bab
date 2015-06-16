class CombineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
	  sums = cart.items.group(:product_id).sum(:quanity)
      sums.each do |product_id, quantity|
	    if quantity > 1
		  cart.items.where(product_id: product_id).delete_all
		  cart.items.create(product_d: product_id, quantity: quantity)
    	end
	  end
	end
  end

  def down
    Item.where("quantity>1").each do |item|
	  item.quantity.times do
  	    Item.creat cart_id:item.cart_id, product_id: item.product_id, quantity: 1
	  end
      item.destroy
	end
  end
end

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  BANK = ["국민은행 123456-11-111111", "신한은행 2222-2222222", "농협 34333-333-33333"]

  def add_items_from_cart(cart)
    cart.items.each do |item|
	item.cart_id = nil
	items << item
	end
  end

end

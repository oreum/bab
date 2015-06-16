class CreateDeliveryinfos < ActiveRecord::Migration
  def change
    create_table :deliveryinfos do |t|
	t.string :username
	t.string :receiver
	t.string :number
	t.string :phonenumber
	t.string :address

      t.timestamps null: false
    end
  end
end

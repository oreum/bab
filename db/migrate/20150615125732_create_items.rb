class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity, default: 1
      t.references :product, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

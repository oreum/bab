class AddBankToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :bank, :string
  end
end

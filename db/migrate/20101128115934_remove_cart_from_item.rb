class RemoveCartFromItem < ActiveRecord::Migration
  def self.up
    remove_column :items, :cart_id
    add_column :items, :order_id, :integer
  end

  def self.down
    add_column :items, :cart_id, :integer
    remove_column :items, :order_id
  end
end

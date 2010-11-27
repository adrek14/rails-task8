class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.date :date_placed
      t.boolean :confirmation
      t.boolean :payment

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

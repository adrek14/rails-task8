class AddCredentialsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :firstname, :string
    add_column :orders, :lastname, :string
  end

  def self.down
    remove_column :orders, :lastname
    remove_column :orders, :firstname
  end
end

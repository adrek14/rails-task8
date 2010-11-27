class AddAddressToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :street, :string
    add_column :orders, :zipcode, :string
    add_column :orders, :city, :string
    add_column :orders, :country, :string
  end

  def self.down
    remove_column :orders, :country
    remove_column :orders, :city
    remove_column :orders, :zipcode
    remove_column :orders, :street
  end
end

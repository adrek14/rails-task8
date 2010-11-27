class Order < ActiveRecord::Base

  has_many :items
  has_one :user
end

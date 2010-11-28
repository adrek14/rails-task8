class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user
  
  def get_items
      self.items
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :username
  validates_presence_of :username

  has_one :cart
  has_many :orders

  def get_cart_items
      if self.cart == nil
        []
      else
        self.cart.items
      end 
  end

end

class Admins::OrdersController < ApplicationController

  def index
      @orders = Order.where( :confirmation => true )
  end

end

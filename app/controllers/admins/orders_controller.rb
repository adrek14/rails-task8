class Admins::OrdersController < ApplicationController

  def index
      @orders = Order.where( :confirmation => true )
  end

  def show
      @order = Order.find( params[:id] )
      @items = @order.items
  end

end

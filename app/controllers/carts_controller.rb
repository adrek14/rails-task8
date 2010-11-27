class CartsController < ApplicationController

  before_filter :authenticate_user!

  def show
      @items = current_user.get_cart_items
  end

  def add
      current_user.cart = Cart.new  if (@cart = current_user.cart ) == nil     
      @product = Product.find( params[:product_id] )
      current_user.cart.add_item( 1, @product )
      redirect_to cart_path
  end

  def rm
      current_user.cart = Cart.new  if (@cart = current_user.cart ) == nil     
      @product = Product.find( params[:product_id] )
      current_user.cart.rm_item( @product )
      redirect_to cart_path
  end

  def checkout
      @items = current_user.get_cart_items
      @cart = current_user.cart
  end

  def summary
      @cart = current_user.cart
      @cart.update_attributes!( params[:cart] )
      @items = current_user.get_cart_items
      if @cart.save
          render "carts/summary"
      else
          redirect_to checkout_cart_path
      end
  end

  def order
      @cart = current_user.cart
      @cart.confirmation = true
      if @cart.save
          flash[:notice] = "Order has been placed"
          redirect_to "/"
      else
          redirect_to "carts/summary"
      end
  end

end

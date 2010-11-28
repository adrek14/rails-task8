class CartsController < ApplicationController

  before_filter :authenticate_user!

  def show
      Cart.create( :user => current_user )  if current_user.cart == nil
      @items = current_user.cart.items
  end

  def add
      if current_user.cart == nil
          @cart = Cart.create( :user => current_user )
      else
          @cart = current_user.cart
      end
      @product = Product.find( params[:product_id] )
      @cart.add_item( 1, @product )
      redirect_to cart_path
  end

  def rm
      current_user.cart = Cart.new  if (@cart = current_user.cart ) == nil     
      @product = Product.find( params[:product_id] )
      current_user.cart.rm_item( @product )
      redirect_to cart_path
  end

  def checkout
      @items = current_user.cart.items
      @cart = current_user.cart
  end

  def summary
      @cart = current_user.cart
      @cart.update_attributes!( params[:cart] )
      @items = current_user.cart.items
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

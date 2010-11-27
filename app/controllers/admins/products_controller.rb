class Admins::ProductsController < ApplicationController

  def show
  end

  def new
      @product = Category.find( params[:category_id] ).products.new
  end

  def create
      @category = Category.find( params[:category_id] )
      @product = @category.products.new( params[:product] )
      if @product.save
        redirect_to admins_category_path( @category )
      else
        render new_admins_category_product_path
      end
  end

end

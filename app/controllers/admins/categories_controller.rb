class Admins::CategoriesController < Admins::ApplicationController

  def index
      @categories = Category.all
  end

  def show
      @category = Category.find( params[:id] )
  end

  def new
      @category = Category.new
  end

  def create
      @category = Category.new( params[:category] )
      if @category.save
          redirect_to admins_categories_path
      else
          render new_admins_category_path
      end
  end

end

class Admins::PanelsController < ApplicationController

  before_filter :authenticate_admin!

  def show
  end

  

end

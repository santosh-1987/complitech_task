class DashboardController < ApplicationController
  before_filter :authenticate_writer!
  def index
    @writers=Writer.all
    #@writers=Writer.where("is_admin = ?",false)
    #@writers = Writer.where(:is_admin.exists => true)
  end

end

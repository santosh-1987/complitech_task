class HomeController < ApplicationController

  def index
    if current_writer.is_admin == true
      flash[:notice] = "Welcome to Administrator Page !!!"
      redirect_to dashboard_home_index_path
    else
      @writer=current_writer
    end

  end

  def dashboard

  end

  def invite_writers
    if current_writer.is_admin == true

    else
      flash[:error] = "Access Denied"
      redirect_to root_path
    end
  end
end

class WritersController < ApplicationController
  skip_before_filter :authenticate_writer!
  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(params[:writer])
    if @writer.save
      redirect_to :controller=>'dashboard',:action=>'index'
    end
  end

  def index
    @writers=Writer.all
  end

  def destroy
    @writer = Writer.find(params[:id])
    if @writer.destroy
      redirect_to writers_path
      flash[:notice] = "Destroyed successfully"
    end
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def update
    @writer = Writer.find(params[:id])
    if @writer.update_attributes(params[:writer])
      flash[:notice] = "Writer Updated Successfully"
      redirect_to writers_path
    else
      render :new
    end
  end






end

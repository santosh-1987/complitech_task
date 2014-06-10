class WritersController < ApplicationController
  skip_before_filter :authenticate_writer!, :only=> [:new,:create]
  def new
    if params[:identity].present?
      @invite = Invitation.find_by_token_and_expired(params[:identity],false)
      if @invite.present?
        @writer = Writer.new(:email => @invite.email)
      else
        flash[:alert] = "You have already registered/Token is expired. Contact Administrator."
        redirect_to new_writer_session_path
      end
    else
    #   Condition to handle if params of identity not present
      flash[:error] = "A Token is required forr registartion, contact Administrator."
      redirect_to new_writer_session_path
    end
  end

  def create
    @writer = Writer.new(params[:writer])
    if @writer.save
      Invitation.find_by_email_and_expired(@writer.email,false).update_attribute("expired",true)
      # sign_in_and_redirect @user, :event => :authentication
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

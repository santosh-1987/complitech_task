class InvitationsController < ApplicationController

  def index
    if current_writer.is_admin == true
      @invitations = Invitation.all
    else
      flash[:alert] = "Access Denied"
      redirect_to root_path
    end
  end

  def new
    @invitation = Invitation.new
  end

  def create
    emails = params[:invitation][:email].split(",")
    @errors = Array.new
    emails.each do |email|
      @invitation = Invitation.new(:email => email,:expired => false)
      if @invitation.save
         WriterMailer.delay.invite_confirmation(@invitation)
        #WriterMailer.invite_confirmation(@invitation).deliver
      else
        @errors << "#{email} : #{@invitation.errors.full_messages.join(",")}"
      end
    end
    if @errors.empty?
      redirect_to :back,:notice => "Invitation(s) Sent Successfully"
    else
      redirect_to :back,:alert =>"Following Invitations rejected: <br/> #{@errors.join("<br/>")}"
    end
  end

  def pending_invitation
    @invitations = Invitation.all
  end

end



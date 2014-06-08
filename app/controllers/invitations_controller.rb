class InvitationsController < ApplicationController

def new
 @invitation = Invitation.new
end

def create
  @invitation = Invitation.new(params[:invitation])
   if @invitation.save
   	WriterMailer.invite_confirmation(@invitation).deliver
   redirect_to :back,:notice => "Invitation has been send successfully"
end
end
end



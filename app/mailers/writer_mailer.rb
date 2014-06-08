class WriterMailer < ActionMailer::Base
  default from: "email2jyotisingh@gmail.com"

  def invite_confirmation(invitation)
      @invitation = invitation
      mail(:to => invitation.email, :subject => "Registered")
  end

end

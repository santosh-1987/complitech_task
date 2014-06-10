class Writer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation,:first_name,:last_name,:screen_name,:sex
  after_create :destroy_token
  after_destroy :destroy_invitee
  # Destroy token for invited user
  def destroy_token
    @invite = Invitation.find_by_email_and_expired(self.email,false)
    if @invite.present?
      @invite.update_attribute("expired",true)
    end
  end
  # Destroying invitation record
  def destroy_invitee
    @invite = Invitation.find_by_email(self.email)
    if @invite.present?
      @invite.destroy
    end
  end
end

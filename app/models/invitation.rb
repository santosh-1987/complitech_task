class Invitation < ActiveRecord::Base
 attr_accessible :email
 # validates :email, :presence => true,
 #          format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
 #                    message: 'The format of Email is invalid'}


 # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

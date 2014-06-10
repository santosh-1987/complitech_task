class Invitation < ActiveRecord::Base
  include Tokenable
  attr_accessible :email, :token,:expired
  validates :email, :presence   => true,
            :format     => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: 'The format of Email is invalid' },
            :uniqueness => { :case_sensitive => false }
end

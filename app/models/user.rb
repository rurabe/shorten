class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 								:presence => true, 
								  									:uniqueness => { :case_sensitive => false }, 
								  									:format => { :with => VALID_EMAIL_REGEX }
  validates :name, 									:presence => true
  validates :password, 							:presence => true,
  										 							:length => { :minimum => 5 }
  validates :password_confirmation, :presence => true

  has_secure_password

  before_create :downcase_email







  protected

  	def downcase_email
  		self.email.downcase!
  	end

end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 								:presence => true, 
								  									#:uniqueness => { :case_sensitive => false }, 
								  									:format => { :with => VALID_EMAIL_REGEX }
  validates :password, 							:presence => true,
  										 							:length => { :minimum => 5 }
  validates :password_confirmation, :presence => true

  has_secure_password

  before_create :downcase_email
  before_create :create_remember_token







  protected

  	def downcase_email
  		self.email.downcase!
  	end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

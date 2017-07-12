class User < ApplicationRecord
	has_many :articles, dependent: :destroy
def self.authenticate(username_or_email="", login_password="")
	
end
	
end

class User < ApplicationRecord
  has_many :articles, dependent: :destroy
   def self.authenticate(email="", login_password="")
    if user = User.find_by_sql("SELECT * FROM users WHERE email=='#{email}' AND password=='#{login_password}'")
      return user
    else
      return false
    end
  end
 
end

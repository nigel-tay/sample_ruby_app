class User < ApplicationRecord
    before_save { self.email = email.downcase }
    #parentheses are optional in Ruby methods. In this case validates(:name, presence: true) is the same thing
    #if hashes are the last argument in a function call, the curly braces are optional
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with:VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end

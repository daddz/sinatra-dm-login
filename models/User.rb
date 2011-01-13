require './helpers/helpers'
require 'digest/sha1'
require 'dm-validations'
require 'date'

class User
  include DataMapper::Resource
  
  property :id,			          Serial
  property :login,		        String, :key => true, :length => (3..40), :required => true
  property :hashed_password, 	String
  property :email,		        String,	:format => :email_address
  property :salt,		          String
  property :created_at,		    DateTime,	:default => DateTime.now
  
  validates_presence_of :login, :email

  def password=(pass)
    @password = pass
    self.salt = Helpers::random_string(10) unless self.salt
    self.hashed_password = User.encrypt(@password, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end
  
  def self.authenticate(login, pass)
    u = User.first(:login => login)
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt) == u.hashed_password
    nil
  end
end

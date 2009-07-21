require 'digest/sha1'

# this model expects a certain database layout and its based on the name/login pattern. 
class User < ActiveRecord::Base
  
  def self.authenticate(login, pass)
    find_by_login_and_password(login, sha1(pass))
  end  

  def change_login(login)
    update_attribute "login",login
  end
  def change_password(pass)
    update_attribute "password", self.class.sha1(pass)
  end
    
  protected

  def self.sha1(pass)
    Digest::SHA1.hexdigest("pillow-hats--#{pass}--")
  end
    
  before_create :crypt_password
  
  def crypt_password
    write_attribute("password", self.class.sha1(password))
  end

  validates_length_of :login, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_presence_of :login, :password, :password_confirmation
  validates_uniqueness_of :login, :on => :create
  validates_confirmation_of :password, :on => :create     
end

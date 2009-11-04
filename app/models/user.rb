class User < ActiveRecord::Base
  
  
  before_save :digest_password


  validates_presence_of :nome, :message => "não pode ser nulo ou branco"
  validates_presence_of :login, :message => "não pode ser nulo ou branco"
  validates_presence_of :pass, :message => "não pode ser nulo ou branco", :on => :save

  def self.digest(message)
    Digest::SHA1.hexdigest(message)
  end
 protected
  def digest_password
    self.pass = User.digest("#{self.login}#{self.pass}") if pass
  end

end

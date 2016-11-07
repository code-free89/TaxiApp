class User < ApplicationRecord
  attr_accessor :password, :password_confirmation


  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 3..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_digest= BCrypt::Engine.hash_secret(password, salt)
      puts "Digested " + self.password_digest
    else
      puts "No password to digest"
    end
  end
  def clear_password
    self.password = nil
  end

  #has_secure_password

end

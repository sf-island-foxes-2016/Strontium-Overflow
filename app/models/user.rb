require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions
  has_many :comments
  has_many :answers
  has_many :votes

  validates_uniqueness_of :email
  validates_presence_of :name, :email, :password_hash

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    return self.password == password
  end

end

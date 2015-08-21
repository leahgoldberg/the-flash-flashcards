class User < ActiveRecord::Base
  include BCrypt
  has_many :stats

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /\S+@[a-z0-9]+\S+.{1}[a-z]{2,3}/i

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(args)
    if user = self.find_by(email: args[:email])
      user.password == args[:password] ? user : nil
    else
      nil
    end
  end
end

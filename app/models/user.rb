class User < ActiveRecord::Base
  include BCrypt
  has_many :decks, foreign_key: :creator_id
  has_many :rounds, foreign_key: :player_id
  has_many :guesses, through: :rounds

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password_hash, presence: true


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

end

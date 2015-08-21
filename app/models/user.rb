class User < ActiveRecord::Base
  include BCrypt
  has_many :decks, foreign_key: :creator_id
  has_many :rounds, foreign_key: :player_id
  has_many :guesses, through: :rounds


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

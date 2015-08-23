class AddCardToGuesses < ActiveRecord::Migration
  def change
    add_reference :guesses, :card
  end
end

class ChangeInputFromGuess < ActiveRecord::Migration
  def change
    remove_column :guesses, :input
  end
end

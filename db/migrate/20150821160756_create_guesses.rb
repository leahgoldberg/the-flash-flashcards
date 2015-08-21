class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :input, null:false
      t.references :round
      t.timestamps
    end
  end
end

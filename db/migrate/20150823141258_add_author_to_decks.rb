class AddAuthorToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :author, :integer
  end
end

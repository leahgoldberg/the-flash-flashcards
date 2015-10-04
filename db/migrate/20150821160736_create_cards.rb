class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question, null:false
      t.string :answer, null:false
      t.boolean :correct
      t.references :deck
      t.timestamps
    end
  end
end

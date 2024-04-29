class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :width
      t.integer :height
      t.integer :mine_number
      t.string :name

      t.timestamps
    end
  end
end

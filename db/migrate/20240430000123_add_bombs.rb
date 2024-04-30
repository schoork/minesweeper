class AddBombs < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :bombs, :integer, array: true, default: []
  end
end

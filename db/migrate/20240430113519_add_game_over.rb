class AddGameOver < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :game_over, :boolean, default: false
  end
end

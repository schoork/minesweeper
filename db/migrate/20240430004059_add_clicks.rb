class AddClicks < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :clicks, :integer, array: true, default: []
  end
end

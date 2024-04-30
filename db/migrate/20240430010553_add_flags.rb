class AddFlags < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :flags, :integer, array: true, default: []
  end
end

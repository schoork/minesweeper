class RemoveUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :boards, :user, index: true, foreign_key: true

    drop_table :users

    add_column :boards, :email, :string
  end
end

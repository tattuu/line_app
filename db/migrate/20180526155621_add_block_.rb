class AddBlock < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :block, :integer
    add_column :maybe_friends, :block, :integer
  end
end

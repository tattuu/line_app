class RemoveStatusFromFriends < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :status, :integer
  end
end

class AddGroupToMessageAndAddUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :group, :text
  end
end

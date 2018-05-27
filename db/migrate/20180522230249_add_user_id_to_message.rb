class AddUserIdToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :id, :text
  end
end

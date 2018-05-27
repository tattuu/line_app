class AddGroupNameToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :group_name, :string
  end
end

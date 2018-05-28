class AddStatusMessageAndAccoutIdAndAllowToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status_message, :string
    add_column :users, :account_id, :string
    add_column :users, :allow, :boolean
  end
end

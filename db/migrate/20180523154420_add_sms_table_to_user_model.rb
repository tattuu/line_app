class AddSmsTableToUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sms, :text
  end
end

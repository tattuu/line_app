class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :from
      t.integer :to
      t.integer :status

      t.timestamps
    end
  end
end

class CreateMaybeFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :maybe_friends do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end

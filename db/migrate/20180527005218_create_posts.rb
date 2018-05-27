class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :talk_id
      t.integer :speaker
      t.string :content

      t.timestamps
    end
  end
end

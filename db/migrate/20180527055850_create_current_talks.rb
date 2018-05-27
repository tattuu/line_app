class CreateCurrentTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :current_talks do |t|
      t.integer :user_id
      t.integer :talk_params

      t.timestamps
    end
  end
end

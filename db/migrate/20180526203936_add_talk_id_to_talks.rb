class AddTalkIdToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :talk_id, :integer
  end
end

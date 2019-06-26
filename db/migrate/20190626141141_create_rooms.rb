class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :room_name
      t.string :creator_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

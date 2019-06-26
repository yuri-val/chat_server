class CreateJoinTableRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rooms, :users do |t|
      t.string :room_id
      t.string :user_id

      t.index [:room_id, :user_id]
      t.index [:user_id, :room_id]
    end
  end
end

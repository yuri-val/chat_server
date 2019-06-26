class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false 
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end

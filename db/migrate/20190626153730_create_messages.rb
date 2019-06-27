class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.belongs_to :room, foreign_key: true, type: :string
      t.belongs_to :user, foreign_key: true, type: :string
      t.text :message

      t.timestamps
    end
  end
end

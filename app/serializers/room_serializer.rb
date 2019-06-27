class RoomSerializer < ActiveModel::Serializer
  attribute :room_id do
    object.id
  end
  attributes :room_name, :creator_id, :created_at
  has_many :users
end

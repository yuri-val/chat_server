class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :messages
  has_many :own_rooms, class_name: 'Room', foreign_key: :creator_id
  has_and_belongs_to_many :rooms
end

class Room < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :messages
  has_and_belongs_to_many :users
end

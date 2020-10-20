class Room < ApplicationRecord
  has_many :room_users
  has_many :messages
  has_many :users, through: :room_users

  validates :name, presence: true
end
# has_many :messages, dependent: :destroy
# has_many :users, through: :room_users, dependent: :destroy

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :birthday
    validates :gender
  end

  enum gender: { man: 0, woman: 1, other: 2}

  has_many :posts
  has_many :messages
  has_many :rooms, through: :room_users
  has_many :room_users
end

#email validation, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
#password validation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
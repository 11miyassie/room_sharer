class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :title
    validates :explain
    validates :prefecture_id
    validates :local
    validates :price
    validates :building
    validates :image
  end

  belongs_to :user
  has_many :comments
  has_one_attached :image
end
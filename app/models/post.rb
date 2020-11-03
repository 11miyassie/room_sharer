class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :title
    validates :explain
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :local
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }
    validates :building
    validates :image
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
end

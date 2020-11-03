class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  

  with_options presence: true do
    validates :title, length: { maximum: 60 }
    validates :explain, length: { maximum: 1000 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :local, length: { maximum: 20 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }
    validates :building, length: { maximum: 20 }
    validates :image
  end

  validates :other, length: { maximum: 1000 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
end

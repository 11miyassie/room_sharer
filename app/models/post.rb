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
  end

  belongs_to :user

end
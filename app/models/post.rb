class Post < ApplicationRecord

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
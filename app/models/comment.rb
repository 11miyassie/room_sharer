class Comment < ApplicationRecord
  validates :text, presence: true, length: { maximum: 500 }

  belongs_to :post
  belongs_to :user
end

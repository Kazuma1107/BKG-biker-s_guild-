class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_recruitment
  validates :comment, presence: true, length: { minimum: 2, maximum: 200 }
end

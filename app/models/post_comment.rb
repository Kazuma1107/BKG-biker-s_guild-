class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_recruitment
  validates :comment, presence: true, length: {maximum: 200}
end
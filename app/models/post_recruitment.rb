class PostRecruitment < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :body, presence: true, length: { maximum: 200 }
end

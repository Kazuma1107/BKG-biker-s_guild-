class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_images, dependent: :destroy
  has_many :post_recruitments,dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #自分がフォローされるとき
  has_many :reverse_of_relationships, class_name: "Relationship",  foreign_key: "followed_id", dependent: :destroy
  #自分をフォローしている人をフォローされている関係を通じて参照
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  #自分がフォローするとき
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #自分がフォローしている人をフォローしている関係を通じて参照
  has_many :followings, through: :relationships, source: :followed
  
  
  
  
  has_one_attached :profile_image
  
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
  
  def get_profile_image(width, height)
    
    unless profile_image.attached?
          
           file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
           profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
           profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end

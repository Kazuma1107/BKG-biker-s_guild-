class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_images, dependent: :destroy
  has_many :post_recruitments,dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  has_one_attached :profile_image
  
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :license,                                length: {minimum: 2, maximum: 20}
  validates :favorite_manufacture,                   length: {minimum: 2, maximum: 20}
  validates :favorite_motorcycle,                    length: {minimum: 2, maximum: 20}
  validates :your_motorcycle,                        length: {minimum: 2, maximum: 20}
  validates :your_area,                              length: {minimum: 2, maximum: 20}
  validates :have_been_riding,                       length: {minimum: 2, maximum: 20}
  validates :etc,                                    length: {minimum: 2, maximum: 20}
  validates :sex,                                    length: {minimum: 1, maximum: 20}
  def get_profile_image(width, height)
    
    unless profile_image.attached?
          
           file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
           profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
           profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end

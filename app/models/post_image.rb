class PostImage < ApplicationRecord
  belongs_to        :user
  has_one_attached :image
  
  
  
  #画像が投稿されなかった場合の処理、Activestrageに用意した画像を格納する　
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end
end

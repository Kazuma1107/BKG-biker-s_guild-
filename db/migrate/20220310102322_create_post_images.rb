class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :user_id
      t.text   :caption
      t.timestamps
    end
  end
end
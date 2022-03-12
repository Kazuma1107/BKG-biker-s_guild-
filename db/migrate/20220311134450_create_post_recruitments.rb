class CreatePostRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_recruitments do |t|
      
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end

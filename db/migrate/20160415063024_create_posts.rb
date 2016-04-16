class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :tTitle
      t.string :fTitle
      t.string :subject
      t.string :content
      

      t.timestamps null: false
    end
  end
end

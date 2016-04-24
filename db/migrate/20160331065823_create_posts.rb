class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.boolean :answer
      t.text :comment
      t.text :link
      t.float :rate
      t.integer :count_favourite

      t.timestamps null: false
    end
  end
end

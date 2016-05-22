class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.boolean :answer
      t.integer :user_id
      t.integer :post_id
    end
    add_index :user_answers, :user_id
    add_index :user_answers, :post_id
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :author_id
      t.text :body

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :author_id
  end
end

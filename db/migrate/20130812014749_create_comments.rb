class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :author_id
      t.string :body

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :author_id
  end
end

class AddProfileColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :political_views, :string
    add_column :users, :religious_views, :string
    add_column :users, :looking_for, :string
    add_column :users, :interested_in, :string
    add_column :users, :favorite_quotes, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
  end
end

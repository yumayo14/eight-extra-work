class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :address, :string
    add_column :users, :avatar, :string
    add_column :users, :facebook_url, :string
    add_column :users, :summary, :text
    add_column :users, :gender, :string
  end
end

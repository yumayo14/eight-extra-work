class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :birthday, :date, null: true
    add_column :users, :address, :string
    add_column :users, :avatar, :string
    add_column :users, :introduction, :string, limit: 25
    add_column :users, :facebook_url, :string
    add_column :users, :summary, :text
    add_column :users, :gender, :string
    add_column :users, :timing, :string
    add_column :users, :post_code, :string, limit: 7
    add_column :users, :homepage_url, :string
    add_column :users, :career_status, :string
  end
end

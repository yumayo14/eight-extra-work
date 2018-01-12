class AddHomepageUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :homepage_url, :string
  end
end

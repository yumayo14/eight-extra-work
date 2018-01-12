class AddPostCodeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :post_code, :integer
  end
end

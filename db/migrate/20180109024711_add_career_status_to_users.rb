class AddCareerStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :career_status, :string
  end
end

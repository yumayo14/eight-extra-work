class AddTimingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :timing, :string
  end
end

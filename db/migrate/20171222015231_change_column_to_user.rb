class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :birthday, :date, null: true
  end

  def down
    change_column :users, :birthday, :date, null: false
  end
end

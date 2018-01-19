class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text    :message
      t.integer :user_id, null: false, foreign_key: true
      t.integer :receive_user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end

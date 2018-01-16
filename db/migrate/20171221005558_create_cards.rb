class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :image, null: false
      t.references :user
      t.references :career
      t.timestamps
    end
  end
end

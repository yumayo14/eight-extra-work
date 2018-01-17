class CreateTelephones < ActiveRecord::Migration[5.1]
  def change
    create_table :telephones do |t|
      t.string :num, limit: 11
      t.references :telephone_type
      t.references :user
      t.timestamps
    end
  end
end

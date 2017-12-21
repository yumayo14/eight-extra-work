class CreateTelephoneTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :telephone_types do |t|
      t.string :name
      t.references :telephone
      t.timestamps
    end
  end
end

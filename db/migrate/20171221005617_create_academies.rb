class CreateAcademies < ActiveRecord::Migration[5.1]
  def change
    create_table :academies do |t|
      t.string :school_type
      t.string :name
      t.string :major
      t.string :degree
      t.date :from
      t.date :to
      t.references :user
      t.timestamps
    end
  end
end

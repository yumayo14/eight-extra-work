class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :department
      t.string :position
      t.date   :from
      t.date   :to
      t.references :user
      t.references :company
      t.references :card
      t.timestamps
    end
  end
end

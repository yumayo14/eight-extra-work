class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false
      t.string :url
      t.string :company_phone_num, limit: 11
      t.timestamps
    end
  end
end

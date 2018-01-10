class AddCompanyPhoneNumToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :company_phone_num, :integer
  end
end

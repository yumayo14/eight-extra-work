class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


#Usersコントローラにおける処理の切り出し
# 以下の条件分岐は、名刺情報編集というformで情報を保存する際に、companiesテーブルとcareersテーブルの情報を保存した上で、他のユーザー情報更新の際に、正しくformを動作させるために必要

  def company_update(company_params)
    if company_params
      if self.present?
        self.update(company_params)
      end
    end
  end

  def career_update(career_params)
    if career_params
      if self.present?
        self.update(career_params)
      end
    end
  end

end

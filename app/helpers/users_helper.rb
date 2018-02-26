module UsersHelper

def combined_company(career)
  combined_company = Company.find_by(id: career.company_id) if current_user.careers.present?
end

def combined_card(career)
  combined_card = Card.find_by(id: career.card.id) if current_user.careers.present?
end

def searched_user_company(user)
  user_company = user.companies.last if user.companies.present?
  return user_company.try(:company_name)
end

def searchd_user_department(user)
  user_career = user.careers.last if user.careers.present?
  return user_career.try(:department)
end

end

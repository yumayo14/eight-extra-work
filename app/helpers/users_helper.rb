module UsersHelper

def combined_company(career)
  combined_company = Company.find_by(id: career.company_id) if current_user.careers
end

def combined_card(career)
  combined_card = Card.find_by(id: career.card.id) if current_user.careers
end

end

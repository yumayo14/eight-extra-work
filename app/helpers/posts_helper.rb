module PostsHelper

  def company_search(post)
    follower_career = Career.where(user_id: post.user_id).last
    follower_company = Company.where(id: follower_career.company_id).last
    return follower_company.company_name
  end

  def department_search(post)
    follower_career = Career.where(user_id: post.user_id).last
    return follower_career.department
  end

  def position_search(post)
    follower_career = Career.where(user_id: post.user_id).last
    return follower_career.position
  end

end

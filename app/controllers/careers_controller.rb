class CareersController < ApplicationController

  before_action :user_set, only: [:show, :create, :update]

  def create
    @user.update(user_params)

    @company = current_user.companies.new(company_params)
    @company.save

    @career = current_user.careers.new(career_params)
    @career.save

    @card = current_user.cards.new(card_params)
    @card.save
      if @card.save(card_params)
        redirect_to user_path(current_user.id)
      else
        render "show"
      end

    # @new_card = @new_career.build_card(user_id: @user.id)
    # @new_card.save

  end

  def update
    @user.update(user_params)

    @company = Company.find(params[:company][:id])
    @company.update(company_params)

    @career = Career.find(params[:id])
    @career.update(career_params)

    @card = Card.find(params[:card][:id])
    @card.update(card_params)
      if @card.update(card_params)
        redirect_to user_path(@user.id)
      else
        render "show"
      end
  end

private
  def user_set
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:avatar, :introduction, :summary, :gender, :birthday, :career_status, :timing, :name, :email, :post_code, :address, :homepage_url)
  end

  def company_params
    params.require(:company).permit(:id, :company_name, :company_phone_num)
  end

  def career_params
    params.require(:career).permit(:department, :position, :from, :to).merge(company_id: @company.id)
  end

  def card_params
    params.require(:card).permit(:id, :image).merge(career_id: @career.id)
  end

end

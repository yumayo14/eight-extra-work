class UsersController < ApplicationController

  before_action :user_set, only: [:show, :edit, :update]

  def index
  end

  def show
    @academy = Academy.new
    @academies = current_user.academies
    @companies = current_user.companies

      @new_company = Company.new
      @company = @user.companies.last

      @careers = current_user.careers

      @new_career = Career.new
      @career = @user.careers.last

    @new_card = Card.new

    @latest_card = current_user.cards.last
  end

  def new
  end

  def create
  end

  def search
    @user = User.where('name Like(?)',"%#{params[:keyword]}%").limit(30)
    @company = Company.where('company_name Like(?)',"%#{params[:keyword]}%").limit(3)
  end

  # def search_me
  #   @user = User.where('name Like(?)',"%#{params[:keyword]}").limit(30)
  #   @company = Company.where('name Like(?)',"#{params[:keyword]}").limit(3)
  # end

  def edit
  end

  def update
    @user.update(user_params)
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render "show"
      end
    @latest_card = @user.cards.last
    @company = @user.companies.last
    @career = @user.careers.last

    if params[:company].present?
      if @company.present?
        @company.update(company_params)
      else
        @company = @user.companies.new(company_params)
        @company.save
      end
    end

    if params[:career][:card_id] == nil
      if @career.present?
        @career.update(career_params)
      else
        @career = @user.careers.new(career_params)
        @career.save
      end
    end
  end

  def user_set
    @user = User.find(params[:id])
  end

  def profile
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :introduction, :summary, :gender, :birthday, :career_status, :timing, :name, :email, :post_code, :address, :homepage_url)
  end

  # def career_summary_params
  #   params.require(:user).permit(:summary)
  # end

  # def personal_info_params
  #   params.require(:user).permit(:gender, :birthday)
  # end

  # def career_status
  #   params.require(:user).permit(:career_status, :timing)
  # end

  # def basic_info_params
  #   params.require(:user).permit(:name, :email, :post_code, :address, :homepage_url)
  # end


  def company_params
    params.require(:company).permit(:company_name, :company_phone_num)
  end

  def career_params
    params.require(:career).permit(:department, :position, :from, :to).merge(user_id: current_user.id, company_id: @company.id, card_id: @latest_card.id)
  end

end

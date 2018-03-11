class UsersController < ApplicationController

  before_action :user_set, only: [:show, :edit, :update, :profile]
  before_action :latest_company_set, only: [:index, :show,  :update, :message_link]
  before_action :latest_career_set, only: [:show, :update]
  before_action :latest_card_set, only: [:index, :show, :message_link]

  def index
    @followers = current_user.following
    @users = User.where('name Like(?)',"%#{params[:keyword]}%").limit(30) unless params[:keyword].blank?
    @companies = Company.where('company_name Like(?)',"%#{params[:keyword]}%").limit(3) unless params[:keyword].blank?
  end

  def show
    @company = Company.new
    @companies = @user.companies


    @career = current_user.careers.new
    @careers = @user.careers

    # カードモデルのみ、Userモデルとのネストがないが、ユーザーのidという情報を、テーブルにデータを保存するために必要なので、current_userを用いてnewアクションを走らせている
    @card = Card.new

    @academy = Academy.new
    @academies = @user.academies

  end

  def edit
  end

  def update
    @user.update(user_params)
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render "show"
      end

    @latest_company.company_update(company_params) if params[:company]
    @latest_career.career_update(career_params) if params[:career]
  end

    def message_link
      @followers = current_user.following
    end

  private

  def user_set
    @user = User.find(params[:id])
  end

  def latest_company_set
    @latest_company = current_user.companies.last
  end

  def latest_career_set
    @latest_career = current_user.careers.last
  end

  def latest_card_set
    @latest_card = current_user.cards.last
  end

  def user_params
    params.require(:user).permit(:avatar, :introduction, :summary, :gender, :birthday, :career_status, :timing, :name, :email, :post_code, :address, :homepage_url)
  end

  def company_params
    params.require(:company).permit(:company_name, :company_phone_num)
  end

  def career_params
    params.require(:career).permit(:department, :position, :from, :to).merge(company_id: @latest_company.id)
  end

end

class UsersController < ApplicationController

  before_action :user_set, only: [:show, :edit, :update, :profile]

  def index
    @followers = current_user.following
  end

  def show
    @company = Company.new
    @companies = @user.companies
    @latest_company = @user.companies.last


    @career = Career.new
    @careers = @user.careers
    @latest_career = @user.careers.last

    # カードモデルのみ、Userモデルとのネストがないが、ユーザーのidという情報を、テーブルにデータを保存するために必要なので、current_userを用いてnewアクションを走らせている
    @card = Card.new
    @latest_card = @user.cards.last

    @academy = Academy.new
    @academies = @user.academies

  end

  def new
  end

  def create
  end

  def search
    @latest_company = current_user.companies.last
    @users = User.where('name Like(?)',"%#{params[:keyword]}%").limit(30)
    @companies = Company.where('company_name Like(?)',"%#{params[:keyword]}%").limit(3)
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
    @latest_company = @user.companies.last
    @latest_career = @user.careers.last

# 以下の条件分岐は、名刺情報編集というformで情報を保存する際に、companiesテーブルとcareersテーブルの情報を保存した上で、他のユーザー情報更新の際に、正しくformを動作させるために必要

    if params[:company].present?
      if @latest_company.present?
        @latest_company.update(company_params)
      end
    end

    if params[:career].present?
      if @latest_career.present?
        @latest_career.update(career_params)
      end
    end
  end

  def profile
  end

  private

  def user_set
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar, :introduction, :summary, :gender, :birthday, :career_status, :timing, :name, :email, :post_code, :address, :homepage_url)
  end

  def company_params
    params.require(:company).permit(:company_name, :company_phone_num)
  end

  def career_params
    params.require(:career).permit(:department, :position, :from, :to).merge(user_id: current_user.id, company_id: @latest_company.id)
  end

end

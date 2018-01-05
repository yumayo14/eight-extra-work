class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = current_user
    @company = Company.new
  end

  def create
    @user = current_user
    @company = Company.new(company_params)
    @user.save
    @company.save
    redirect_to user_path
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:birthday, :address, :facebook_url)
  end

  def company_params
    params.require(:company).permit(:name)
  end

end

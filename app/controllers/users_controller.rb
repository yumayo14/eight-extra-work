class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @edit = User.new
    @edit.save
  end

  def update
  end

  def index
  end
end

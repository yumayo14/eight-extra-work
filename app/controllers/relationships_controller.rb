class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    # userモデルのfollowメソッドを呼び出す
    current_user.follow(current_user,@user)
    respond_to do |format|
      format.html { redirect_to controller: :users, action: :profile, id: params[:followed_id] }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(current_user,@user)
    respond_to do |format|
      format.html { redirect_to controller: :users, action: :profile, id: params[:followed_id] }
      format.js
    end
  end
end

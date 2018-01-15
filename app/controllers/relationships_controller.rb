class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    # userモデルのfollowメソッドを呼び出す
    current_user.follow(current_user,user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(current_user,user)
    redirect_to user
  end
end

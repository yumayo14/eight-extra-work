class PostsController < ApplicationController
  before_action :user_set, only: [:index, :create]

  def index
    @post = current_user.posts.new
    @posts = Post.all
    @latest_company = current_user.companies.last
    @latest_career = current_user.careers.last
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
      if @post.save(post_params)
        redirect_to user_posts_path
      else
        render :index
      end
  end

private
  def user_set
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:text, :image)
  end

end

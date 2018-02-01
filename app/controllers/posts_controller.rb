class PostsController < ApplicationController
  before_action :user_set, only: [:index, :create]

  def index
    @post = @user.posts.new

    posts = current_user.posts
    room_posts = Post.where(user_id: current_user.following.ids) | (posts)


    @viewed_posts = room_posts.sort{|new_post,old_post| old_post.created_at <=> new_post.created_at}

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
    @user = User.find(params[:user_id])
    # poster_ids = Post.where(user_id: )
    # @poster = User.find_by(id: )
  end

  def post_params
    params.require(:post).permit(:text, :image)
  end

end

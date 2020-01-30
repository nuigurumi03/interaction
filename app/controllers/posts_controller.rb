class PostsController < ApplicationController

  def index
    @posts = Post.includes(:images).order('created_at DESC')
  end

  def new
    @post = Post.new
    @post.images.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :detail, :prefecture_id, :city, :house_code, :build_name, images_attributes: [:image, :id]).merge(user_id:current_user.id)
  end

end

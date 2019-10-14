class PostsController < ApplicationController
  def index
    @posts = Post.all
    @search = Post.ransack(params[:q])
    @posts = @search.result
    #@post_image = PostImage.find_by(post_id: @post.id)
    #@post_image = PostImage.find_by(post_id: @post.id)
  end

  def show
    @post = Post.find(params[:id])
    @post_image = PostImage.find_by(post_id: @post.id)
    @post_comment = PostComment.new
    #@post_comments = PostComment.includes(:end_user).where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_user_id = current_admin_user.id
    @post.save
    redirect_to posts_path
  end

  def edit

  end

  def update
  end

  def destroy
    @post = Post.find(patams[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
      def post_params
          params.require(:post).permit(:admin_user_id, :title, :category, :country, :prefectures, :city, :place, :date, :image_id, :content, post_images_images: [])
      end

end

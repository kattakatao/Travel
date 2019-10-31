class PostsController < ApplicationController

  PER= 5

  def index
     # @posts = Post.all
     # #検索機能(ransack使わず)#
     # prefectures = { "北海道"=>1,"青森県"=>2,"岩手県"=>3}
     # aaa = prefectures.keys.find{|key| key =~ /北海/ }
     # bbb = prefectures[aaa]

     # @ccc = Post.find_by(prefectures: bbb)
    # @q = Post.ransack(search_params)
    #@countries = @q.result
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true).page(params[:page]).per(PER).order(created_at: :desc)
    # binding.pry
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
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
      def post_params
          params.require(:post).permit(:admin_user_id, :title, :category, :country, :prefectures, :city, :place, :date, :image_id, :content, post_images_images: [])
      end

       # def search_params
       #   params[:q] || {
       #     prefectures_in: Post.prefectures_i18n.invert.map{|key, value| [key, Post.prefectures[value]]}
       #   }
       # end

end

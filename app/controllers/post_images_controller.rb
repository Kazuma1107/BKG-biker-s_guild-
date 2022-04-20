class PostImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメーター　Imageカラムとcaptionカラムの受け渡しのみ許可する。imageカラムはアクティブストレージを使用して作成。
  private

  def post_image_params
    params.require(:post_image).permit(:image, :caption)
  end
end

class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @post_images = @user.post_images.page(params[:page])  #@userに関連する投稿すべてを取得して、@post_imagesに渡す
  end

  def edit
      @user = current_user
  end
  
  def update
      @user = current_user
      if @user.update(user_params)
         redirect_to user_path
      else
       render :edit
      end
  end



private
  def user_params
     params.require(:user).permit(:name, :license, :favorite_manufacture, :favorite_motorcycle, :your_motorcycle, :your_area, :have_been_riding, :etc, :sex, :profile_image)
  end
end  
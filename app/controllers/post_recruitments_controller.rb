class PostRecruitmentsController < ApplicationController
  
  def new
      @post_recruitment = PostRecruitment.new
  end
  
  def create
      @post_recruitment = PostRecruitment.new(post_recruitment_params)
      @post_recruitment.user_id = current_user.id
       if @post_recruitment.save
         redirect_to post_recruitments_path
       else
         render :new
       end
  end

  def index
      @post_recruitments = PostRecruitment.page(params[:page])
  end

  def show
      @post_recruitment = PostRecruitment.find(params[:id])
      @post_comment = PostComment.new
  end
  
  def destroy
      @post_recruitment = PostRecruitment.find(params[:id])
      @post_recruitment.destroy
      redirect_to post_recruitments_path
  end 
  
  private
  
  def post_recruitment_params
      params.require(:post_recruitment).permit(:body)
  end
  
end

class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    post_recruitment = PostRecruitment.find(params[:post_recruitment_id])
    comment = current_user.post_comments.new(post_comment_params) # 書き方省略　comment = PostComment.new(post_comment_params),  comment.user.id = current_user.id　と同義
    comment.post_recruitment_id = post_recruitment.id
    if comment.save
      redirect_to post_recruitment_path(post_recruitment)
    else
      redirect_to post_recruitment_path(params[:post_recruitment_id])
    end
  end

  def show
    @post_recruitment = PostRecruitment.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_recruitment_path(params[:post_recruitment_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

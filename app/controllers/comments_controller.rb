class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @blog = Blog.find(params[:blog_id])
    if @comment.save
      @blog.comments << @comment
    end
    redirect_to blog_path(@blog)
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end

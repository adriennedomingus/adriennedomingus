class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(date: :desc)
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @comment = Comment.new
  end
end

class BlogsController < ApplicationController
  def index
    @page = params[:page].to_i
    @blogs = Blog.paginate(:page => @page, :per_page => 10).order(date: :desc)
  end

  def show
    @blog = Blog.find_by(slug: params[:slug])
    @comment = Comment.new
    render file: "/app/views/errors/not_found.html.erb" unless @blog
  end
end

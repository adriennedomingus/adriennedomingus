class User::BlogsController < User::BaseController
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.slug)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find_by(slug: params[:slug])
  end

  def update
    @blog = Blog.find(params[:slug])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog.slug)
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :date, :content)
  end
end

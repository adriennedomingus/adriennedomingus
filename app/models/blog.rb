class Blog < ActiveRecord::Base
  has_many :comments
  before_save :set_slug

  def post_date
    date.strftime("%B %d, %Y")
  end

  def previous
    Blog.where("date < ?", self.date).order(date: :desc).first
  end

  def next
    Blog.where("date > ?", self.date).order(date: :asc).first
  end

  def set_slug
    self.slug = self.title.parameterize
  end
end

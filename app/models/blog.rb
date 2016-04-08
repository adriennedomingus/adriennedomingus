class Blog < ActiveRecord::Base
  has_many :comments

  def post_date
    date.strftime("%B %d, %Y")
  end
end

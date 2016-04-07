class Blog < ActiveRecord::Base

  def post_date
    date.strftime("%B %d, %Y")
  end
end

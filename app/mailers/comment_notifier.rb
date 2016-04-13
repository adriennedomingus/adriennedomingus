class CommentNotifier < ApplicationMailer
  def inform(blog, comment)
    @blog = blog
    @comment = comment
    mail(to: "adrienne.domingus@gmail.com", subject: "New Comment")
  end
end

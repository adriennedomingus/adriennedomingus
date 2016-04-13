class CommentNotifier < ApplicationMailer
  def inform(blog, comment)
    @blog = blog
    @comment = comment
    mail(to: User.first.email, subject: "New Comment")
  end
end

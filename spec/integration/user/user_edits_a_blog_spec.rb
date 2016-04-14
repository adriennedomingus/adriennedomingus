require "rails_helper"

RSpec.feature "user edits a blog" do
  scenario "logged in user edits a blog" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    blog = Blog.create(title: "Blog title", date: "April 17, 2016", content: "content", slug: "blog-title")
    visit edit_user_blog_path(blog.slug)

    fill_in :blog_title, with: "New Blog Title"
    fill_in :blog_content, with: "updated content"
    click_on "Update Blog"
    expect(page).to have_content "New Blog Title"
    expect(page).to have_content "April 17, 2016"
    expect(page).to have_content "updated content"
  end

  scenario "visitor cannot edit a blog" do
    blog = Blog.create(title: "Blog title", date: "April 17, 2016", content: "content", slug: "blog-title")
    visit edit_user_blog_path(blog.slug)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end

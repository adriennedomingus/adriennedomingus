require "rails_helper"

RSpec.feature "commenting" do
  scenario "visitor makes a comment" do
    User.create(username: "adrienne", email: "adrienne.domingus@gmail.com", password: "password")
    blog = Blog.create(title: "First blog title", content: "some content", date: Date.new(2016, 03, 17), slug: "first-blog-title")

    visit blog_path(blog.slug)
    expect(page).to have_content("Comments: 0")

    fill_in :comment_name, with: "Test"
    fill_in :comment_content, with: "Leaving a comment"
    click_on "Leave a comment!"

    expect(page).to have_content("Comments: 1")
    expect(page).to have_content("Test")
    expect(page).to have_content("Leaving a comment")
  end
end

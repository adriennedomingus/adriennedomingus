require "rails_helper"

RSpec.feature "visitor sees blog index" do
  scenario "visitor sees blog index" do
    blog1 = Blog.create(title: "First blog title", content: "some content", date: Date.new(2016, 03, 17), slug: "first-blog-title")
    blog2 = Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 24), slug: "second-blog-title")

    visit blogs_path(:page => 1)

    expect(page).to have_content(blog1.title)
    expect(page).to have_content(blog2.title)
    expect(page).to have_content("March 17, 2016")
    expect(page).to have_content("March 24, 2016")
  end
end

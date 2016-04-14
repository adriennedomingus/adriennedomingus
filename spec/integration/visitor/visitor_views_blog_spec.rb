require "rails_helper"

RSpec.feature "visitor views specific blog" do
  scenario "visitor views blog" do
    blog1 = Blog.create(title: "First blog title", content: "some content", date: Date.new(2016, 03, 17), slug: "first-blog-title")
    Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 24), slug: "blog-title")

    visit blogs_path
    click_on blog1.title
    expect(page).to have_content(blog1.title)
    expect(page).to have_content("March 17, 2016")
    expect(page).to have_content(blog1.content)
  end
end

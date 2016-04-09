require "rails_helper"

RSpec.feature "visitor views next and previous blogs" do
  scenario "visitor views next blog" do
    blog1 = Blog.create(title: "First blog title", content: "some content", date: Date.new(2016, 03, 17))
    Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 24))
    Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 10))
    blog4 = Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 20))

    visit blog_path(blog1)
    click_on "Next Post"
    expect(current_path).to eq(blog_path(blog4))
  end

  scenario "visitor views previous blog" do
    blog1 = Blog.create(title: "First blog title", content: "some content", date: Date.new(2016, 03, 17))
    Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 24))
    Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 10))
    blog4 = Blog.create(title: "Second blog title", content: "some more content", date: Date.new(2016, 03, 15))

    visit blog_path(blog1)
    click_on "Previous Post"
    expect(current_path).to eq(blog_path(blog4))
  end
end

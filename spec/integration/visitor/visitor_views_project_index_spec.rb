require 'rails_helper'

RSpec.feature "project index" do
  scenario "visitor views project index" do
    project = Project.create(name: "project", production: "www.google.com", code: "www.github.com", description: "some content")
    project2 = Project.create(name: "project2", production: "www.facebook.com", code: "www.twitter.com", description: "some content")

    visit root_path
    click_on "PORTFOLIO"
    expect(page).to have_link(project.name, href: project_path(project.slug))
    expect(page).to have_link(project2.name, href: project_path(project2.slug))
  end
end

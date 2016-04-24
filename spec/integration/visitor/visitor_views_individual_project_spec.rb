require 'rails_helper'

RSpec.feature "visitor views individual project" do
  scenario "visitor views a project" do
    project = Project.create(name: "project", production: "www.google.com", code: "www.github.com", description: "some content")
    visit project_path(project.slug)

    expect(page).to have_content(project.name)
    expect(page).to have_link("Production", href: project.production)
    expect(page).to have_link("Code", href: project.code)
    expect(page).to have_content(project.description)
  end
end

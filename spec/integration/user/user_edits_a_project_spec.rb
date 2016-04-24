require 'rails_helper'

RSpec.feature "user edits project" do
  scenario "user edits project" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    project = Project.create(name: "project", production: "www.google.com", code: "www.github.com", description: "some content")
    visit project_path(project.slug)
    click_on "Edit"

    fill_in :project_name, with: "new project name"
    click_on "Update Project"

    expect(page).to have_link("new project name", href: "/projects/new-project-name")
  end
end

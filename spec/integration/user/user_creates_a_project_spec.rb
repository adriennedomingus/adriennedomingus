require 'rails_helper'

RSpec.feature "user creates a project" do
  scenario "user creates a project" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on "New Project"
    fill_in :project_name, with: "project name"
    fill_in :project_description, with: "project description"
    fill_in :project_production, with: "www.example.com"
    fill_in :project_code, with: "www.example2.com"
    fill_in :project_screenshot, with: "www.example3.com"
    click_on "Create Project"

    project = Project.last

    expect(page).to have_link(project.name, href: project_path(project.slug))
  end
end

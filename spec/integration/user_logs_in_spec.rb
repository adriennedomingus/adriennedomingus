require "rails_helper"

RSpec.feature "user logs in" do
  scenario "user logs in" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    visit login_path

    fill_in :session_username, with: "adrienne"
    fill_in :session_password, with: "password"
    click_on "Log In"

    expect(page).to have_content("Log Out")
  end
end

require "rails_helper"

RSpec.feature "user logs out" do
  scenario "user logs out" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")

    visit login_path

    fill_in :session_username, with: "adrienne"
    fill_in :session_password, with: "password"
    click_on "Log In"

    click_on "Log Out"

    expect(page).to_not have_content("Log Out")
  end
end

RSpec.feature "user writes a blog" do
  scenario "logged in user writes a blog" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario "visitor cannot write a blog" do
    visit new_user_blog_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end

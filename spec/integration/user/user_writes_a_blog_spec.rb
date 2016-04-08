RSpec.feature "user writes a blog" do
  scenario "logged in user writes a blog" do
    user = User.create(username: "adrienne", password: "password", email: "adrienne.domingus@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_blog_path

    fill_in :blog_title, with: "New Blog Title"
    fill_in :blog_date, with: "2016/04/17"
    fill_in :blog_content, with: "content content content content content content content content content content"
    click_on "Create Blog"
    expect(page).to have_content "New Blog Title"
    expect(page).to have_content "April 17, 2016"
    expect(page).to have_content "content content content content content content content content content content"
  end

  scenario "visitor cannot write a blog" do
    visit new_user_blog_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end

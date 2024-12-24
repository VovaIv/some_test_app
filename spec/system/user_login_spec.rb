require 'rails_helper'

RSpec.describe "User login", type: :system do
  let(:user) { User.create(email: "test@example.com", password: "password") }

  it "redirects to the dashboard page after login" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Welcome to my app")
  end
end

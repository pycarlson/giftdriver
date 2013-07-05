require 'spec_helper'

describe "User authentication" do
  let(:user) { create(:user) }

  it "lets a user sign up" do
    visit new_user_registration_path

    fill_in "user_email", with: "cat@example.com"
    fill_in "user_full_name", with: "Cat Cat"
    fill_in "user_zipcode", with: "12345"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button('Sign up')

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "lets a user log in " do
    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button('Log in')

    expect(page).to have_content "Signed in successfully."
  end
end

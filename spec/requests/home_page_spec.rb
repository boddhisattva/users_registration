require 'rails_helper'

RSpec.describe "HomePage", type: :request do
  describe "Home page" do
    it "should have the content 'User Registrations App'" do
      visit root_path
      expect(page).to have_content('User Registrations App')
    end
  end

  describe "Sign up now! link" do
    it "should go to the sign up page" do
      visit root_path
      click_link "Sign up now!"
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Password Confirmation')
    end
  end
end

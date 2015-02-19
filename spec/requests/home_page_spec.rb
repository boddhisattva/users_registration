require 'rails_helper'

RSpec.describe "HomePage", type: :request do
  describe "Home page" do
    it "should have the content 'User Registrations App'" do
      # get home_pages_path
      visit root_path
      expect(page).to have_content('User Registrations App')
      # expect(response).to have_http_status(200)
    end
  end
end

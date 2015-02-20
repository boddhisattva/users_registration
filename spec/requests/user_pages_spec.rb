require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  describe "User pages" do

    subject { page }

    describe "signup page" do
      before { visit signup_path }

      it { should have_content('Sign up') }
      it { should has_title?('Sign up') }
    end

    describe "signup" do

      before { visit signup_path }

      let(:submit) { "Create user" }

      describe "with invalid information" do
        before do
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Password Confirmation", with: "foo"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
        end

        it "should display error message for matching password not matching password confirmation" do
          click_button submit
          expect(page).to have_content('Password confirmation doesn\'t match Password')
        end
      end

      describe "with valid information" do
        before do
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Password Confirmation", with: "foobar"
        end

        it "should create a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        it "should redirect to a login page with an appropriate welcome message" do
          click_button submit
          expect(page).to have_content('Welcome aboard')
        end

        it "should redirect to a login page with an appropriate welcome message" do
          click_button submit
          expect(page).to have_content('user@example.com')
        end

        it "should redirect to a login page with a logout link" do
          click_button submit
          expect(page).to have_content('Log out')
        end

      end
    end

  end

end

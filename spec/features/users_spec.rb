require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "Authentications" do
      context "without signing into app" do
          it "sign in with google authenticator" do
              visit ('/')
              expect(page).to have_content("Login with Google")
              click_link "Login"
              expect(page).to have_content("Sign Out")
          end
      end
  end
end

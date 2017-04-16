=begin
require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: "12345678910",
      info: {
        name: "Jesse",
      },
      credentials: {
        oauth_token: "abcdefg12345",
        expires_at: DateTime.now,
      }
    })
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link("Sign in with Google")
    expect(page).to have_content("Jesse")
    expect(page).to have_link("Logout")
  end
end
=end
require 'rails_helper'

describe User do
  describe ".from_omniauth" do
    it "creates or updates itself from an oauth hash" do
      auth = {
        provider: "google",
        uid: "12345678910",
        info: {
          name: "Jesse",
        },
        credentials: {
          token: "abcdefg12345",
          expires_at: DateTime.now
        }
      }
      User.from_omniauth(auth)
      new_user = User.first
      expect(new_user.provider).to eq("google")
      expect(new_user.uid).to eq("12345678910")
      expect(new_user.name).to eq("Jesse")
      expect(new_user.oauth_token).to eq("abcdefg12345")
      expect(new_user.oauth_expires_at.to_i).to eq((auth[:credentials][:expires_at]).to_i)
    end
  end
end


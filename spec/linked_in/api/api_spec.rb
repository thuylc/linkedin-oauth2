require "spec_helper"

describe LinkedInOauth2::API do
  context "With no access token" do
    let(:err_msg) { LinkedInOauth2::ErrorMessages.no_access_token }

    it "Raises an error" do
      expect{LinkedInOauth2::API.new}.to raise_error(LinkedInOauth2::InvalidRequest, err_msg)
    end
  end

  shared_examples "test access token" do
    it "Build a LinkedInOauth2::API instance" do
      expect(subject).to be_kind_of LinkedInOauth2::API
    end

    it "Sets the access_token object" do
      expect(subject.access_token).to be_kind_of LinkedInOauth2::AccessToken
    end

    it "Sets the access_token string" do
      expect(subject.access_token.token).to eq access_token
    end
  end

  context "With a string access token" do
    let(:access_token) { "dummy_access_token" }
    subject {LinkedInOauth2::API.new(access_token)}

    include_examples "test access token"
  end

  context "With a LinkedInOauth2::AccessToken object" do
    let(:access_token) { "dummy_access_token" }
    let(:access_token_obj) { LinkedInOauth2::AccessToken.new(access_token) }

    subject {LinkedInOauth2::API.new(access_token_obj)}

    include_examples "test access token"
  end
end

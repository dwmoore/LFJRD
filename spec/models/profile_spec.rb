require 'rails_helper'

RSpec.describe Profile, type: :model do

  it { should belong_to(:user) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }


  describe "#get_email" do
    it "returns the profile's  ser email" do
      profile = create(:profile)

      expect(profile.get_email).to eq "test@example.com"
    end
  end

  describe "#full_name" do
    it "returns the profile's full name" do
      profile = create(:profile)

      expect(profile.full_name).to eq "Mike Mulligan"
    end
  end
   describe "#repo_service" do
     it "returns Github when a github repo" do
       profile = build_stubbed(:profile, git_app: "http://github.com/some_porfile")

       repo = profile.repo_service

       expect(repo).to eq "github"
     end

     it "returns Bitbucket when a bitbucket repo" do
       profile = build_stubbed(:profile, git_app: "http://bitbucket.com/some_porfile")

       repo = profile.repo_service

       expect(repo).to eq "bitbucket"
     end
   end
end

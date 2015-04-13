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

      expect(profile.full_name).to eq "MyString MyString"
    end
  end
end

require 'rails_helper'

RSpec.describe Profile, type: :model do

  it { should belong_to(:user) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }


  describe "#get_email" do
    it "returns the profile's user email" do
      profile = create(:profile)

      expect(profile.user.email).to eq "test@example.com"
    end
  end
end

require 'rails_helper'

RSpec.describe AssetHistory, type: :model do
  it "check Asset History model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Arrange session model belongs to Assets" do 
    assc = described_class.reflect_on_association(:asset)
    expect(assc.macro).to eq :belongs_to
  end 
end

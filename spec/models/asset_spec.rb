require 'rails_helper'

RSpec.describe Asset, type: :model do
  it "check Asset model belongs to Asset Type" do 
    assc = described_class.reflect_on_association(:asset_type)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Asset model belongs to Bill" do 
    assc = described_class.reflect_on_association(:bill)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Asset model has many to Asset Histories" do 
    assc = described_class.reflect_on_association(:asset_histories)
    expect(assc.macro).to eq :has_many
  end 
end

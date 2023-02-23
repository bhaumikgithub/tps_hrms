require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "check Bill model has many to Assets" do 
    assc = described_class.reflect_on_association(:assets)
    expect(assc.macro).to eq :has_many
  end 
  it "check Bill model belongs to Vendors" do 
    assc = described_class.reflect_on_association(:vendor)
    expect(assc.macro).to eq :belongs_to
  end 
  # it "check Bill model has many attached files" do 
  #   assc = described_class.reflect_on_association(:files)
  #   expect(assc.macro).to eq :has_many_attached
  # end 
end

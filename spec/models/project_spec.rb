require 'rails_helper'

RSpec.describe Project, type: :model do
  it "check Project Model has many Users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end
  it "check Project Model has many project members" do 
    assc = described_class.reflect_on_association(:project_members)
    expect(assc.macro).to eq :has_many
  end
end

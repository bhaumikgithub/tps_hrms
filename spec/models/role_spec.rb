require 'rails_helper'

RSpec.describe Role, type: :model do
  it "check Role Model has many Users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end
  it "check Role Model has many role permissions" do 
    assc = described_class.reflect_on_association(:role_permissions)
    expect(assc.macro).to eq :has_many
  end
  it "check Role Model has many permissions" do 
    assc = described_class.reflect_on_association(:permissions)
    expect(assc.macro).to eq :has_many
  end
end

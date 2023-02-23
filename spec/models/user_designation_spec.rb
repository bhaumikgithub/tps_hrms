require 'rails_helper'

RSpec.describe UserDesignation, type: :model do
  it "check User designation belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
  it "check User designation belongs to designation" do 
    assc = described_class.reflect_on_association(:designation)
    expect(assc.macro).to eq :belongs_to
  end
  it "check User designation belongs to department" do 
    assc = described_class.reflect_on_association(:department)
    expect(assc.macro).to eq :belongs_to
  end
end

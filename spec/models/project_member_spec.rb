require 'rails_helper'

RSpec.describe ProjectMember, type: :model do
  it "check Project Member belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
  it "check Project Member belongs to Project" do 
    assc = described_class.reflect_on_association(:project)
    expect(assc.macro).to eq :belongs_to
  end
end

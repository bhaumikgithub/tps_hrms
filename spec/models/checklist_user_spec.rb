require 'rails_helper'

RSpec.describe ChecklistUser, type: :model do
  it "check Checklist User model belongs to Checklist" do 
    assc = described_class.reflect_on_association(:checklist)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Checklist User model belongs to User" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end 
end

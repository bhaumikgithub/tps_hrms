require 'rails_helper'

RSpec.describe ChecklistItemUser, type: :model do
  it "check Checklist Item User model belongs to Checklist Item" do 
    assc = described_class.reflect_on_association(:checklist_item)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Checklist Item User model belongs to User" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end

require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  
  it "check Checklist Item model belongs to Checklist" do 
    assc = described_class.reflect_on_association(:checklist)
    expect(assc.macro).to eq :belongs_to
  end 
  it "check Checklist Item model has many Checklist item users" do 
    assc = described_class.reflect_on_association(:checklist_item_users)
    expect(assc.macro).to eq :has_many
  end
  it "checks Checklist Item model has many users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end 
end

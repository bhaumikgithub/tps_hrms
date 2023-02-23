require 'rails_helper'

RSpec.describe Checklist, type: :model do
  it "check Checklist has many Checklist Items" do 
    assc = described_class.reflect_on_association(:checklist_items)
    expect(assc.macro).to eq :has_many
  end 
  it "check Checklist has many Checklist users" do 
    assc = described_class.reflect_on_association(:checklist_users)
    expect(assc.macro).to eq :has_many
  end 
  it "check Checklist has many Users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end 
end

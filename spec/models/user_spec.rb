require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create :user}

  it "check user model input fields" do
    expect(user).to be_valid()
  end
  
  describe "User model associations" do
    it "check user model belongs to company" do 
      assc = described_class.reflect_on_association(:company)
      expect(assc.macro).to eq :belongs_to
    end 
    it "check user model has many employees" do 
      assc = described_class.reflect_on_association(:employees)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many free leaves" do 
      assc = described_class.reflect_on_association(:free_leaves)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many leave reports" do 
      assc = described_class.reflect_on_association(:leave_reports)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many educations" do 
      assc = described_class.reflect_on_association(:educations)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many user designations" do 
      assc = described_class.reflect_on_association(:user_designations)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many documents" do 
      assc = described_class.reflect_on_association(:documents)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many work histories" do 
      assc = described_class.reflect_on_association(:work_histories)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many project members" do 
      assc = described_class.reflect_on_association(:project_members)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many projects" do 
      assc = described_class.reflect_on_association(:projects)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many checklist item users" do 
      assc = described_class.reflect_on_association(:checklist_item_users)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many checklist item " do 
      assc = described_class.reflect_on_association(:checklist_items)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many checklist users" do 
      assc = described_class.reflect_on_association(:checklist_users)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many checklists" do 
      assc = described_class.reflect_on_association(:checklists)
      expect(assc.macro).to eq :has_many
    end 
    it "check user model has many asset histories" do 
      assc = described_class.reflect_on_association(:asset_histories)
      expect(assc.macro).to eq :has_many
    end 
  end
end

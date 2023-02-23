require 'rails_helper'

RSpec.describe UserReport, type: :model do
  it "check User Report belongs to Project member" do 
    assc = described_class.reflect_on_association(:project_member)
    expect(assc.macro).to eq :belongs_to
  end
end

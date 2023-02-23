require 'rails_helper'

RSpec.describe ArrangeSession, type: :model do
  it "check Arrange session model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end 
end

require 'rails_helper'

RSpec.describe WorkHistory, type: :model do
  it "check Work history model user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end 
end

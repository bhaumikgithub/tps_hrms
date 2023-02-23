require 'rails_helper'

RSpec.describe Department, type: :model do
  it "check Department Model has many users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end
end

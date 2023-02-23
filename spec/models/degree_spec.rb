require 'rails_helper'

RSpec.describe Degree, type: :model do
  it "check Degree Model has many users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end
end

require 'rails_helper'

RSpec.describe Company, type: :model do
  it "check company has many users" do 
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end
end

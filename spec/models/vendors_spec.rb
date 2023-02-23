require 'rails_helper'

RSpec.describe Vendor, type: :model do
  let(:vendor) {FactoryBot.create :vendor}

  it "checks vendors has many bills " do 
    assc = described_class.reflect_on_association(:bills)
    expect(assc.macro).to eq :has_many
  end
  
  it "checks name validation" do 
    expect(vendor).to be_valid
  end 

end

require 'rails_helper'

RSpec.describe Credential, type: :model do
   
  it "check Credential model belongs to Credential Type" do 
    assc = described_class.reflect_on_association(:credential_type)
    expect(assc.macro).to eq :belongs_to
  end
end

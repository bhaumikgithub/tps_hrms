require 'rails_helper'

RSpec.describe CredentialType, type: :model do
  it "check Credential Type model has many Credentials" do 
    assc = described_class.reflect_on_association(:credentials)
    expect(assc.macro).to eq :has_many
  end
end

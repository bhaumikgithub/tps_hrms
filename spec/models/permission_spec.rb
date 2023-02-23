require 'rails_helper'

RSpec.describe Permission, type: :model do
  it "check Permission Model has many Roles" do 
    assc = described_class.reflect_on_association(:roles)
    expect(assc.macro).to eq :has_many
  end
  it "check Permission Model has many Role Permisssions" do 
    assc = described_class.reflect_on_association(:role_permissions)
    expect(assc.macro).to eq :has_many
  end
end

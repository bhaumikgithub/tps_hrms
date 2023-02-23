require 'rails_helper'

RSpec.describe RolePermission, type: :model do
  it "check Role Permission belongs to role" do 
    assc = described_class.reflect_on_association(:role)
    expect(assc.macro).to eq :belongs_to
  end
  it "check Role Permission belongs to permission" do 
    assc = described_class.reflect_on_association(:permission)
    expect(assc.macro).to eq :belongs_to
  end
end

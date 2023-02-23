require 'rails_helper'

RSpec.describe FreeLeave, type: :model do
  it "check Free Leave Model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end

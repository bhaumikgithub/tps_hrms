require 'rails_helper'

RSpec.describe Document, type: :model do
  it "check Document Model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end

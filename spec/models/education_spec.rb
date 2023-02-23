require 'rails_helper'

RSpec.describe Education, type: :model do
  it "check Education Model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
  it "check Education Model belongs to Degree" do 
    assc = described_class.reflect_on_association(:degree)
    expect(assc.macro).to eq :belongs_to
  end
end

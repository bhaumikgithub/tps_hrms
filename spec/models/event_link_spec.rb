require 'rails_helper'

RSpec.describe EventLink, type: :model do
  it "check Event link Model belongs to user" do 
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
  it "check Event link Model belongs to Event category" do 
    assc = described_class.reflect_on_association(:event_category)
    expect(assc.macro).to eq :belongs_to
  end
end

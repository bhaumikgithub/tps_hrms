require 'rails_helper'

RSpec.describe EventCategory, type: :model do
  it "check Event category Model has many Event links" do 
    assc = described_class.reflect_on_association(:event_links)
    expect(assc.macro).to eq :has_many
  end
end

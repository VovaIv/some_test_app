require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes and quest by default" do
    user = User.new(email: "em@em.com")
    user.password = '111111'
    expect(user).to be_valid
    user.save
    expect(user.type).to eq 'Quest'
  end

  it "is not valid without a email" do
    user = User.new()
    user.password = '111111'

    expect(user).not_to be_valid
  end
end

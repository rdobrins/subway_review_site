require 'rails_helper'

RSpec.describe User, type: :model do
  fn = 'John'
  ln = "Jonas"
  email = 'a@b.com'
  p1 = "password"
  user1 = User.new(first_name: fn, last_name: ln, email: email, password: p1,
                   password_confirmation: p1)
  user2 = User.new(first_name: nil, last_name: ln, email: email, password: p1,
                   password_confirmation: p1)
  user3 = User.new(first_name: fn, last_name: nil, email: email, password: p1,
                   password_confirmation: p1)
  user4 = User.new(first_name: fn, last_name: ln, email: 'what@com',
                   password: p1, password_confirmation: p1)
  it 'has correct information' do
    expect(user1).to be_valid
  end
  it 'has nil first name' do
    expect(user2).to_not be_valid
  end
  it 'has nil last name' do
    expect(user3).to_not be_valid
  end
  it 'has incorrect email' do
    expect(user4).to_not be_valid
  end
  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'not the same password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end

RSpec.describe "#admin?" do
  it "is not an admin if the role is not admin" do
    user = FactoryGirl.create(:user, role: "member")
    expect(user.admin?).to eq(false)
  end

  it "is an admin if the role is admin" do
    user = FactoryGirl.create(:user, role: "admin")
    expect(user.admin?).to eq(true)
  end
end

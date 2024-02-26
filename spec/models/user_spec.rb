require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    let(:invalid_email_user) { FactoryBot.build(:user, email: "false_email")}
    let(:valid_email_user) { FactoryBot.build(:user, email: "email@example.com")}
    it "should return validation false on incorrect email" do
      expect(invalid_email_user.valid?).to be_falsy
    end

    it "should return validation true on correct email" do
      expect(valid_email_user.valid?).to be_truthy
    end
  end
end
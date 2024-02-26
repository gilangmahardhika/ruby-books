require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:isbn) }
    it { should validate_presence_of(:description) }

    let(:author) { FactoryBot.create(:author) }
    let(:book) { FactoryBot.create(:book, author: author, isbn: 1234) }
    let(:invalid_isbn) { FactoryBot.build(:book, author: author, isbn: 1234) }
    it "should validate uniqueness of isbn" do
      expect(book.valid?).to be_truthy
      expect(invalid_isbn.valid?).to be_falsy
    end
  end
end

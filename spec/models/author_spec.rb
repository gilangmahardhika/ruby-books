require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:books).dependent(:destroy)}
  end

  describe "counter cache" do
    let(:author) { FactoryBot.create(:author) }
    it "has 2 books" do
      FactoryBot.create(:book, author: author, isbn: '1123')
      FactoryBot.create(:book, author: author, isbn: '11234')
      expect(author.books_count).to eq(2)
    end
  end
end

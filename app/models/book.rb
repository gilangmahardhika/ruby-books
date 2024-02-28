class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title, :isbn, :description, :year
  validates_uniqueness_of :isbn
  validates_numericality_of :year

  delegate :name, to: :author, prefix: true
end

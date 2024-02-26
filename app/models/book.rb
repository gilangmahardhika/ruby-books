class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title, :isbn, :description
  validates_uniqueness_of :isbn

  delegate :name, to: :author, prefix: true
end

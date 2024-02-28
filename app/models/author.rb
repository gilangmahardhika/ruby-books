class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates_presence_of :name

  scope :with_books, -> { includes(:books) }

  def self.map_authors
    all.map{|a| [a.name, a.id]}
  end
end

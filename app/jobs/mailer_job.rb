class MailerJob < ApplicationJob
  queue_as :default

  def perform(book)
    BooksMailer.new_book(book).deliver
  end
end

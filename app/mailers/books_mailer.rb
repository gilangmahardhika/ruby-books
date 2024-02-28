class BooksMailer < ApplicationMailer
  def new_book(book)
    @book = book
    User.find_each do |user|
      @user = user
      mail(to: user.email, subject: 'New book has been added')
    end
  end
end

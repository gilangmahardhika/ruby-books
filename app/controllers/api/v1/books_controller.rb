class Api::V1::BooksController < Api::V1::ApplicationController
  def index
    @page = params[:page] || 1
    @books = Book.all.page(@page).per(10)
    @total_pages = @books.total_pages
  end

  def show
    @book = Book.find(params[:id])
  end
end
class BooksController < ApplicationController
  before_action :get_book, except: [:index, :new, :create]
  def index
    @books = Book.all.page(params[:page]).per(10)
  end

  def show; end;

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit; end;

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy

    else

    end
    redirect_to books_path
  end

  private
    def get_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :isbn, :description, :author_id)
    end
end

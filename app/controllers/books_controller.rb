class BooksController < ApplicationController
  before_action :get_book, except: [:index, :new, :create]
  before_action :list_authors, only: [:new, :edit, :create, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @books = Book.all.page(page).per(per_page)
  end

  def show; end;

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully created"
      redirect_to book_path(@book), format: :html 
    else
      flash[:error] = @book.errors.full_messages
      render :new
    end
  end

  def edit; end;

  def update
    if @book.update(book_params)
      flash[:success] = "Book successfully updated"
      redirect_to book_path(@book), format: :html
    else
      flash[:error] = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Book successfully deleted"
    else
      flash[:error] = "Failed to delete book"
    end
    redirect_to books_path, format: :html
  end

  private
    def get_book
      @book = Book.find(params[:id])
    end

    def list_authors
      @authors = Author.map_authors
    end

    def book_params
      params.require(:book).permit(:title, :isbn, :description, :year, :author_id)
    end
end

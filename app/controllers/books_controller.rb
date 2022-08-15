class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @detail = Book.find(params[:id])
  end

  def edit
    @detail = Book.find(params[:id])
  end
  
  def update
    detail = Book.find(params[:id])
    detail.update(book_params)
    redirect_to book_path(detail.id)
  end
  
  def destroy
    detail = Book.find(params[:id])
    detail.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

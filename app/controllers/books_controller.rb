class BooksController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]

  def index
    @books = Book.all
    @user = current_user
    @post_book = Book.new
  end

  def create
    @books = Book.all
    @user = current_user
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      redirect_to book_path(@post_book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end

end

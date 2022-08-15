class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_books = @user.books
  end

  def edit
  end
end

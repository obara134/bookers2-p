class UsersController < ApplicationController

  def index
    @user = User.find(current_user[:id])
    @users = User.all
    @book =Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

end

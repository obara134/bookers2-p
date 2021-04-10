class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = User.find(current_user[:id])
    @books = Book.all
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)

  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  praivate
  
  def book_params
    params.require(:book).permit(:title, :body)
  end


end

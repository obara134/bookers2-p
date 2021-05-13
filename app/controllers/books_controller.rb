class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :book_edit_check,only: [:edit]

  def index
    @book = Book.new
    @user = User.find(current_user[:id])
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(book.id)
    else
      @user = User.find(current_user[:id])
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @new_book = Book.new

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updted book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def book_edit_check
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end


end

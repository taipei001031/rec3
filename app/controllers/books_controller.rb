class BooksController < ApplicationController
  def index
  	@books=Book.all.order(id: "DESC")
  	@book=Book.new
  end

  def show
  	@book=Book.find(params[:id])
  end

  def edit
  	@book=Book.find(params[:id])
  end

  def create
 	book = Book.new(list_params)
 	if book.save
 	flash[:notice]="Book was successfully created"
 	redirect_to book_path(book.id)
   else
flash[:notice]="error"
 	redirect_to books_path
   end
  end

  def update
	book=Book.find(params[:id])
	if book.update(list_params)
	flash[:notice]="update was successfully"
	redirect_to book_path(book.id)
	else
	flash[:notice]="error"
	redirect_to book_path(book.id)
	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice]="delete was successfully"
  	redirect_to books_path
  end

  private
  def list_params
  	params.require(:book).permit(:title, :body)
  end
end
